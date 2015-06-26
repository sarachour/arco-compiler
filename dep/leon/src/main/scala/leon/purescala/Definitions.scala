/* Copyright 2009-2015 EPFL, Lausanne */

package leon
package purescala

import utils.Library
import Common._
import Expressions._
import ExprOps._
import Types._
import TypeOps._

object Definitions {

  sealed abstract class Definition extends Tree {
    
    val id: Identifier

    def subDefinitions : Seq[Definition]      // The enclosed scopes/definitions by this definition
  
    def containsDef(df: Definition): Boolean = {
      subDefinitions.exists { sd =>
        sd == df || sd.containsDef(df)
      }
    }

    override def hashCode : Int = id.hashCode
    override def equals(that : Any) : Boolean = that match {
      case t : Definition => t.id == this.id
      case _ => false
    }

    def writeScalaFile(filename: String) {
      import java.io.FileWriter
      import java.io.BufferedWriter
      val fstream = new FileWriter(filename)
      val out = new BufferedWriter(fstream)
      out.write(ScalaPrinter(this))
      out.close()
    }
  }

  /** 
   *  A ValDef declares a new identifier to be of a certain type.
   *  The optional tpe, if present, overrides the type of the underlying Identifier id
   *  This is useful to instantiate argument types of polymorphic functions
   */
  case class ValDef(id: Identifier, tpe: Option[TypeTree] = None) extends Definition with Typed {
    self: Serializable =>

    val getType = tpe getOrElse id.getType

    var defaultValue : Option[FunDef] = None

    def subDefinitions = Seq()

    // Warning: the variable will not have the same type as the ValDef, but 
    // the Identifier type is enough for all use cases in Leon
    def toVariable : Variable = Variable(id)
  }

  /** A wrapper for a program. For now a program is simply a single object. */
  case class Program(units: List[UnitDef]) extends Definition {
    val id = FreshIdentifier("program")

    lazy val library = Library(this)

    def subDefinitions = units
    
    def definedFunctions    = units.flatMap(_.definedFunctions)
    def definedClasses      = units.flatMap(_.definedClasses)
    def classHierarchyRoots = units.flatMap(_.classHierarchyRoots)
    def algebraicDataTypes  = units.flatMap(_.algebraicDataTypes).toMap
    def singleCaseClasses   = units.flatMap(_.singleCaseClasses)
    def modules             = {
      units.flatMap(_.defs.collect {
        case md: ModuleDef => md
      })
    }
    
    lazy val callGraph      = new CallGraph(this)

    def caseClassDef(name: String) = definedClasses.collect {
      case ccd: CaseClassDef if ccd.id.name == name => ccd
    }.headOption.getOrElse(throw LeonFatalError("Unknown case class '"+name+"'"))

    def duplicate = {
      copy(units = units.map{_.duplicate})
    }
    
    def lookupAll(name: String)  = DefOps.searchWithin(name, this)
    def lookup(name: String)     = lookupAll(name).headOption
  }

  object Program {
    lazy val empty: Program = Program(Nil)
  }

  case class TypeParameterDef(tp: TypeParameter) extends Definition {
    def subDefinitions = Seq()
    def freshen = TypeParameterDef(tp.freshen)
    val id = tp.id
  }
 
  /** A package as a path of names */
  type PackageRef = List[String] 

  abstract class Import extends Definition {
    def subDefinitions = Nil
    def importedDefs(implicit pgm: Program): Seq[Definition]
  }

  // import pack._
  case class PackageImport(pack : PackageRef) extends Import {
    val id = FreshIdentifier("import " + (pack mkString "."))
    def importedDefs(implicit pgm: Program): Seq[Definition] = for {
      u <- DefOps.unitsInPackage(pgm, pack)
      d <- u.subDefinitions
      ret <- d match {
        case m: ModuleDef if m.isPackageObject =>
          m.subDefinitions
        case other =>
          Seq(other)
      }
    } yield ret
  }
  // import pack.(...).df
  case class SingleImport(df : Definition) extends Import {
    val id = FreshIdentifier(s"import ${df.id.toString}")
    def importedDefs(implicit pgm: Program): Seq[Definition] =
      List(df)
  }
  // import pack.(...).df._
  case class WildcardImport(df : Definition) extends Import {
    val id = FreshIdentifier(s"import ${df.id.toString}._")
    def importedDefs(implicit pgm: Program): Seq[Definition] =
      df.subDefinitions
  }
  
  case class UnitDef(
    id: Identifier,
    pack : PackageRef,
    imports : Seq[Import],
    defs : Seq[Definition],
    isMainUnit : Boolean // false for libraries/imports
  ) extends Definition {
     
    def subDefinitions = defs
    
    def definedFunctions = defs.flatMap{
      case m: ModuleDef => m.definedFunctions
      case _ => Nil
    }

    def definedClasses = defs.flatMap {
      case c: ClassDef => List(c)
      case m: ModuleDef => m.definedClasses
      case _ => Nil
    }

    def classHierarchyRoots = {
      definedClasses.filter(!_.hasParent)
    }

    def algebraicDataTypes = {
      definedClasses.collect {
        case ccd: CaseClassDef if ccd.hasParent => ccd
      }.groupBy(_.parent.get.classDef)
    }

    def singleCaseClasses = {
      definedClasses.collect {
        case ccd: CaseClassDef if !ccd.hasParent => ccd
      }
    }

    def duplicate = {
      copy(defs = defs map {
        case cd: ClassDef => cd.duplicate
        case m: ModuleDef => m.duplicate
        case d => d
      })
    }

    def modules = defs.collect {
      case md: ModuleDef => md
    }
  }
  
  object UnitDef {
    def apply(id: Identifier, modules : Seq[ModuleDef]) : UnitDef = 
      UnitDef(id,Nil, Nil, modules,true)
  }
  
  /** Objects work as containers for class definitions, functions (def's) and
   * val's. */
  case class ModuleDef(id: Identifier, defs: Seq[Definition], isPackageObject: Boolean) extends Definition {
    
    def subDefinitions = defs
    
    lazy val definedFunctions : Seq[FunDef] = defs.collect { case fd: FunDef => fd }

    lazy val definedClasses : Seq[ClassDef] = defs.collect { case ctd: ClassDef => ctd }

    lazy val classHierarchyRoots : Seq[ClassDef] = defs.collect {
      case ctd: ClassDef if !ctd.hasParent => ctd
    }

    lazy val algebraicDataTypes : Map[AbstractClassDef, Seq[CaseClassDef]] = defs.collect {
      case c@CaseClassDef(_, _, _, Some(p), _) => c
    }.groupBy(_.parent.get.classDef)

    lazy val singleCaseClasses : Seq[CaseClassDef] = defs.collect {
      case c @ CaseClassDef(_, _, _, None, _) => c
    }
    
    def duplicate = copy(defs = defs map {
      case f: FunDef => f.duplicate
      case cd: ClassDef => cd.duplicate
      case other => other
    })
  }

  /** Useful because case classes and classes are somewhat unified in some
   * patterns (of pattern-matching, that is) */
  sealed trait ClassDef extends Definition {
    self =>

    def subDefinitions = fields ++ methods ++ tparams 
      
    val id: Identifier
    val tparams: Seq[TypeParameterDef]
    def fields: Seq[ValDef]
    val parent: Option[AbstractClassType]

    def hasParent = parent.isDefined

    def fieldsIds = fields.map(_.id)

    private var _children: List[ClassDef] = Nil

    def registerChildren(chd: ClassDef) = {
      _children = (chd :: _children).sortBy(_.id.name)
    }

    private var _methods = List[FunDef]()

    def registerMethod(fd: FunDef) = {
      _methods = _methods ::: List(fd)
    }

    def clearMethods() {
      _methods = Nil
    }

    def methods = _methods

    def knownChildren: Seq[ClassDef] = _children

    def knownDescendents: Seq[ClassDef] = {
      knownChildren ++ (knownChildren.map {
        case acd: AbstractClassDef => acd.knownDescendents
        case _ => Nil
      }.foldLeft(List[ClassDef]())(_ ++ _))
    }

    def knownCCDescendents: Seq[CaseClassDef] = knownDescendents.collect {
      case ccd: CaseClassDef =>
        ccd
    }

    val isAbstract: Boolean
    val isCaseObject: Boolean
    
    def duplicate = this match {
      case ab : AbstractClassDef => {
        val ab2 = ab.copy()
        ab.knownChildren foreach ab2.registerChildren
        ab.methods foreach { m => ab2.registerMethod(m.duplicate) }
        ab2
      }
      case cc : CaseClassDef => {
        val cc2 = cc.copy() 
        cc.methods foreach { m => cc2.registerMethod(m.duplicate) }
        cc2
      }
    }
    
    lazy val definedFunctions : Seq[FunDef] = methods
    lazy val definedClasses = Seq(this)
    lazy val classHierarchyRoots = if (this.hasParent) Seq(this) else Nil
    
  }

  /** Abstract classes. */
  case class AbstractClassDef(id: Identifier,
                              tparams: Seq[TypeParameterDef],
                              parent: Option[AbstractClassType]) extends ClassDef {

    val fields = Nil
    val isAbstract   = true
    val isCaseObject = false
    
    lazy val singleCaseClasses : Seq[CaseClassDef] = Nil
  }

  /** Case classes/objects. */
  case class CaseClassDef(id: Identifier,
                          tparams: Seq[TypeParameterDef],
                          fields: Seq[ValDef],
                          parent: Option[AbstractClassType],
                          isCaseObject: Boolean) extends ClassDef {

    val isAbstract = false

    def selectorID2Index(id: Identifier) : Int = {
      val index = fields.zipWithIndex.find(_._1.id == id).map(_._2)

      index.getOrElse {
        scala.sys.error("Could not find '"+id+"' ("+id.uniqueName+") within "+fields.map(_.id.uniqueName).mkString(", "))
      }
    }
    
    lazy val singleCaseClasses : Seq[CaseClassDef] = if (hasParent) Nil else Seq(this)
  }

  // A class that represents flags that annotate a FunDef with different attributes
  class FunctionFlag
  // Whether this FunDef was originally a (lazy) field
  case class IsField(isLazy: Boolean) extends FunctionFlag
  // Compiler annotations given in the source code as @annot
  case class Annotation(annot: String) extends FunctionFlag
  // If this class was a method. owner is the original owner of the method
  case class IsMethod(owner: ClassDef) extends FunctionFlag
  // If this function represents a loop that was there before XLangElimination
  // Contains a copy of the original looping function
  case class IsLoop(orig: FunDef) extends FunctionFlag
  // If extraction fails of the function's body fais, it is marked as abstract
  case object IsAbstract extends FunctionFlag
  // Currently, the only synthetic functions are those that calculate default values of parameters
  case object IsSynthetic extends FunctionFlag

  /** Functions
    *  This class represents methods or fields of objects. By "fields" we mean
    *  fields defined in the body, not the constructor arguments of a case class.
    *  When it comes to verification, all are treated the same (as functions).
    *  They are only differentiated when it comes to code generation/ pretty printing.
    *  By default, the FunDef represents a function/method, unless otherwise specified
    *  by its flags.
    */
  class FunDef(
    val id: Identifier,
    val tparams: Seq[TypeParameterDef],
    val returnType: TypeTree,
    val params: Seq[ValDef]
  ) extends Definition {

    /* Body manipulation */
    
    private var fullBody_ : Expr = NoTree(returnType)
    def fullBody = fullBody_
    def fullBody_= (e : Expr) {
      fullBody_ = e
    }

    def body: Option[Expr] = withoutSpec(fullBody)
    def body_=(b: Option[Expr]) = {
      fullBody = withBody(fullBody, b)
    }

    def precondition = preconditionOf(fullBody)
    def precondition_=(oe: Option[Expr]) = {
      fullBody = withPrecondition(fullBody, oe) 
    }

    def postcondition = postconditionOf(fullBody)
    def postcondition_=(op: Option[Expr]) = {
      fullBody = withPostcondition(fullBody, op) 
    }

    def hasBody                     = body.isDefined
    def hasPrecondition : Boolean   = precondition.isDefined
    def hasPostcondition : Boolean  = postcondition.isDefined

    def isRecursive(p: Program) = p.callGraph.transitiveCallees(this) contains this
    
    /* Nested definitions */
    def nestedFuns = directlyNestedFunDefs(fullBody)
    def subDefinitions = params ++ tparams ++ nestedFuns.toList

    /* Duplication */
    
    def duplicate: FunDef = {
      val fd = new FunDef(id.freshen, tparams, returnType, params)
      fd.copyContentFrom(this)
      fd.copiedFrom(this)
    }
    
    def copyContentFrom(from : FunDef) {
      this.fullBody  = from.fullBody 
      this.addFlag(from.flags.toSeq : _*)
    }

    /* Flags */

    private var flags_ : Set[FunctionFlag] = Set()
    
    def addFlag(flags: FunctionFlag*): FunDef = {
      this.flags_ ++= flags
      this
    }
    
    def flags = flags_
    
    def annotations: Set[String] = flags_ collect { case Annotation(s) => s }
    def canBeLazyField    = flags.contains(IsField(true))  && params.isEmpty && tparams.isEmpty
    def canBeStrictField  = flags.contains(IsField(false)) && params.isEmpty && tparams.isEmpty
    def canBeField        = canBeLazyField || canBeStrictField
    def isRealFunction    = !canBeField
    def isSynthetic       = flags contains IsSynthetic
    def methodOwner       = flags collectFirst { case IsMethod(cd) => cd }

    /* Wrapping in TypedFunDef */
    
    def typed(tps: Seq[TypeTree]) = {
      assert(tps.size == tparams.size)
      TypedFunDef(this, tps)
    }

    def typed = {
      TypedFunDef(this, tparams.map(_.tp))
    }
    
  }


  // Wrapper for typing function according to valuations for type parameters
  case class TypedFunDef(fd: FunDef, tps: Seq[TypeTree]) extends Tree {
    val id = fd.id

    def signature = {
      if (tps.nonEmpty) {
        id.toString+tps.mkString("[", ", ", "]")
      } else {
        id.toString
      }
    }

    private lazy val typesMap: Map[TypeParameterDef, TypeTree] = {
      (fd.tparams zip tps).toMap.filter(tt => tt._1.tp != tt._2)
    }

    def translated(t: TypeTree): TypeTree = instantiateType(t, typesMap)

    def translated(e: Expr): Expr = instantiateType(e, typesMap, paramsMap)

    def paramSubst(realArgs: Seq[Expr]) = {
      require(realArgs.size == params.size)
      (params map { _.id } zip realArgs).toMap
    }

    def withParamSubst(realArgs: Seq[Expr], e: Expr) = {
      replaceFromIDs(paramSubst(realArgs), e)
    }

    def applied(realArgs: Seq[Expr]): FunctionInvocation = {
      FunctionInvocation(this, realArgs)
    }

    def applied: FunctionInvocation =
      applied(params map { _.toVariable })

    /** 
     *  Params will return ValDefs instantiated with the correct types
     *  For such a ValDef(id,tp) it may hold that (id.getType != tp)  
     */
    lazy val (params: Seq[ValDef], paramsMap: Map[Identifier, Identifier]) = {
      if (typesMap.isEmpty) {
        (fd.params, Map())
      } else {
        val newParams = fd.params.map {
          case vd @ ValDef(id, _) =>
            val newTpe = translated(vd.getType)
            val newId = FreshIdentifier(id.name, newTpe, true).copiedFrom(id)
            ValDef(newId).setPos(vd)
        }

        val paramsMap: Map[Identifier, Identifier] = (fd.params zip newParams).map { case (vd1, vd2) => vd1.id -> vd2.id }.toMap

        (newParams, paramsMap)
      }
    }

    lazy val functionType = FunctionType(params.map(_.getType).toList, returnType)

    lazy val returnType: TypeTree = translated(fd.returnType)

    private var trCache = Map[Expr, Expr]()

    private def cached(e: Expr): Expr = {
      trCache.getOrElse(e, {
        val res = translated(e)
        trCache += e -> res
        res
      })
    }

    def fullBody      = cached(fd.fullBody)
    def body          = fd.body map cached
    def precondition  = fd.precondition map cached
    def postcondition = fd.postcondition map cached

    def hasImplementation = body.isDefined
    def hasBody           = hasImplementation
    def hasPrecondition   = precondition.isDefined
    def hasPostcondition  = postcondition.isDefined

    override def getPos = fd.getPos
  }
}
