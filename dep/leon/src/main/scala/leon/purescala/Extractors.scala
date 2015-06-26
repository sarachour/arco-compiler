/* Copyright 2009-2015 EPFL, Lausanne */

package leon
package purescala

import Expressions._
import Common._
import Types._
import Constructors._
import ExprOps._
import Definitions.Program

object Extractors {

  object UnaryOperator {
    def unapply(expr: Expr) : Option[(Expr,(Expr)=>Expr)] = expr match {
      case Not(t) => Some((t,not))
      case UMinus(t) => Some((t,UMinus))
      case BVUMinus(t) => Some((t,BVUMinus))
      case BVNot(t) => Some((t,BVNot))
      case SetCardinality(t) => Some((t,SetCardinality))
      case MultisetCardinality(t) => Some((t,MultisetCardinality))
      case MultisetToSet(t) => Some((t,MultisetToSet))
      case SetMin(s) => Some((s,SetMin))
      case SetMax(s) => Some((s,SetMax))
      case CaseClassSelector(cd, e, sel) => Some((e, CaseClassSelector(cd, _, sel)))
      case CaseClassInstanceOf(cd, e) => Some((e, CaseClassInstanceOf(cd, _)))
      case TupleSelect(t, i) => Some((t, tupleSelect(_, i, t.getType.asInstanceOf[TupleType].dimension)))
      case ArrayLength(a) => Some((a, ArrayLength))
      case Lambda(args, body) => Some((body, Lambda(args, _)))
      case Forall(args, body) => Some((body, Forall(args, _)))
      case (ue: UnaryExtractable) => ue.extract
      case _ => None
    }
  }

  trait UnaryExtractable {
    def extract: Option[(Expr, (Expr)=>Expr)]
  }

  object BinaryOperator {
    def unapply(expr: Expr) : Option[(Expr,Expr,(Expr,Expr)=>Expr)] = expr match {
      case LetDef(fd, body) => Some((fd.fullBody, body, 
        (fdBd, body) => {
          fd.fullBody = fdBd
          LetDef(fd, body) 
        }
      ))
      case Equals(t1,t2) => Some((t1,t2,Equals))
      case Implies(t1,t2) => Some((t1,t2, implies))
      case Plus(t1,t2) => Some((t1,t2,plus))
      case Minus(t1,t2) => Some((t1,t2,minus))
      case Times(t1,t2) => Some((t1,t2,times))
      case Division(t1,t2) => Some((t1,t2,Division))
      case Remainder(t1,t2) => Some((t1,t2,Remainder))
      case Modulo(t1,t2) => Some((t1,t2,Modulo))
      case LessThan(t1,t2) => Some((t1,t2,LessThan))
      case GreaterThan(t1,t2) => Some((t1,t2,GreaterThan))
      case LessEquals(t1,t2) => Some((t1,t2,LessEquals))
      case GreaterEquals(t1,t2) => Some((t1,t2,GreaterEquals))
      case BVPlus(t1,t2) => Some((t1,t2,plus))
      case BVMinus(t1,t2) => Some((t1,t2,minus))
      case BVTimes(t1,t2) => Some((t1,t2,times))
      case BVDivision(t1,t2) => Some((t1,t2,BVDivision))
      case BVRemainder(t1,t2) => Some((t1,t2,BVRemainder))
      case BVAnd(t1,t2) => Some((t1,t2,BVAnd))
      case BVOr(t1,t2) => Some((t1,t2,BVOr))
      case BVXOr(t1,t2) => Some((t1,t2,BVXOr))
      case BVShiftLeft(t1,t2) => Some((t1,t2,BVShiftLeft))
      case BVAShiftRight(t1,t2) => Some((t1,t2,BVAShiftRight))
      case BVLShiftRight(t1,t2) => Some((t1,t2,BVLShiftRight))
      case ElementOfSet(t1,t2) => Some((t1,t2,ElementOfSet))
      case SubsetOf(t1,t2) => Some((t1,t2,SubsetOf))
      case SetIntersection(t1,t2) => Some((t1,t2,SetIntersection))
      case SetUnion(t1,t2) => Some((t1,t2,SetUnion))
      case SetDifference(t1,t2) => Some((t1,t2,SetDifference))
      case Multiplicity(t1,t2) => Some((t1,t2,Multiplicity))
      case MultisetIntersection(t1,t2) => Some((t1,t2,MultisetIntersection))
      case MultisetUnion(t1,t2) => Some((t1,t2,MultisetUnion))
      case MultisetPlus(t1,t2) => Some((t1,t2,MultisetPlus))
      case MultisetDifference(t1,t2) => Some((t1,t2,MultisetDifference))
      case mg@MapGet(t1,t2) => Some((t1,t2, MapGet))
      case MapUnion(t1,t2) => Some((t1,t2,MapUnion))
      case MapDifference(t1,t2) => Some((t1,t2,MapDifference))
      case MapIsDefinedAt(t1,t2) => Some((t1,t2, MapIsDefinedAt))
      case ArraySelect(t1, t2) => Some((t1, t2, ArraySelect))
      case Let(binder, e, body) => Some((e, body, Let(binder, _, _)))
      case Require(pre, body) => Some((pre, body, Require))
      case Ensuring(body, post) => Some((body, post, Ensuring))
      case Assert(const, oerr, body) => Some((const, body, Assert(_, oerr, _)))
      case (ex: BinaryExtractable) => ex.extract
      case _ => None
    }
  }

  trait BinaryExtractable {
    def extract: Option[(Expr, Expr, (Expr, Expr)=>Expr)]
  }

  object NAryOperator {
    def unapply(expr: Expr) : Option[(Seq[Expr],(Seq[Expr])=>Expr)] = expr match {
      case Choose(pred, impl) => Some((Seq(pred) ++ impl.toSeq, {
        case Seq(pred) => Choose(pred, None)
        case Seq(pred, impl) => Choose(pred, Some(impl))
      }))
      case fi @ FunctionInvocation(fd, args) => Some((args, FunctionInvocation(fd, _)))
      case mi @ MethodInvocation(rec, cd, tfd, args) => Some((rec +: args, as => MethodInvocation(as.head, cd, tfd, as.tail)))
      case fa @ Application(caller, args) => Some(caller +: args, as => application(as.head, as.tail))
      case CaseClass(cd, args) => Some((args, CaseClass(cd, _)))
      case And(args) => Some((args, and))
      case Or(args) => Some((args, or))
      case FiniteSet(els, base) =>
        Some(( els.toSeq, els => FiniteSet(els.toSet, base) ))
      case FiniteMap(args, f, t) => {
        val subArgs = args.flatMap{case (k, v) => Seq(k, v)}
        val builder = (as: Seq[Expr]) => {
          def rec(kvs: Seq[Expr]) : Seq[(Expr, Expr)] = kvs match {
            case Seq(k, v, t@_*) =>
              (k,v) +: rec(t)
            case Seq() => Seq()
            case _ => sys.error("odd number of key/value expressions")
          }
          FiniteMap(rec(as), f, t)
        }
        Some((subArgs, builder))
      }
      case NonemptyMultiset(args) => 
        Some((args, NonemptyMultiset))
      case ArrayUpdated(t1, t2, t3) => Some((Seq(t1,t2,t3), (as: Seq[Expr]) => 
        ArrayUpdated(as(0), as(1), as(2))))
      case NonemptyArray(elems, Some((default, length))) => {
        val all = elems.map(_._2).toSeq :+ default :+ length
        Some(( all, as => {
          val l = as.length
          nonemptyArray(as.take(l-2), Some( (as(l-2), as(l-1)) ) )
        }))
      }
      case NonemptyArray(elems, None) =>
        val all = elems.map(_._2).toSeq
        Some(( all, finiteArray))
      case Tuple(args) => Some((args, tupleWrap))
      case IfExpr(cond, thenn, elze) => Some((
        Seq(cond, thenn, elze),
        { case Seq(c,t,e) => IfExpr(c,t,e) }
      ))
      case MatchExpr(scrut, cases) => Some((
        scrut +: cases.flatMap { 
          case SimpleCase(_, e) => Seq(e)
          case GuardedCase(_, e1, e2) => Seq(e1, e2) 
        }, 
        (es: Seq[Expr]) => {
          var i = 1
          val newcases = for (caze <- cases) yield caze match {
            case SimpleCase(b, _) => i+=1; SimpleCase(b, es(i-1)) 
            case GuardedCase(b, _, _) => i+=2; GuardedCase(b, es(i-2), es(i-1)) 
          }

          matchExpr(es(0), newcases)
        }
      ))
      case Passes(in, out, cases) => Some((
        in +: out +: cases.flatMap { _.expressions },
        { case Seq(in, out, es@_*) => {
          var i = 0
          val newcases = for (caze <- cases) yield caze match {
            case SimpleCase(b, _) => i+=1; SimpleCase(b, es(i-1)) 
            case GuardedCase(b, _, _) => i+=2; GuardedCase(b, es(i-1), es(i-2)) 
          }

          passes(in, out, newcases)
        }}
      ))
      case (ex: NAryExtractable) => ex.extract
      case _ => None
    }
  }

  trait NAryExtractable {
    def extract: Option[(Seq[Expr], (Seq[Expr])=>Expr)]
  }

  object StringLiteral {
    def unapply(e: Expr)(implicit pgm: Program): Option[String] = e match {
      case CaseClass(cct, args) =>
        for {
          libS <- pgm.library.String
          if cct.classDef == libS
          (_, chars) <- isListLiteral(args.head)
          if chars.forall(_.isInstanceOf[CharLiteral])
        } yield {
          chars.collect{ case CharLiteral(c) => c }.mkString
        }
      case _ =>
        None
    }
  }
  
  object TopLevelOrs { // expr1 AND (expr2 AND (expr3 AND ..)) => List(expr1, expr2, expr3)
    def unapply(e: Expr): Option[Seq[Expr]] = e match {
      case Let(i, e, TopLevelOrs(bs)) => Some(bs map (let(i,e,_)))
      case Or(exprs) =>
        Some(exprs.flatMap(unapply).flatten)
      case e =>
        Some(Seq(e))
    }
  }
  object TopLevelAnds { // expr1 AND (expr2 AND (expr3 AND ..)) => List(expr1, expr2, expr3)
    def unapply(e: Expr): Option[Seq[Expr]] = e match {
      case Let(i, e, TopLevelAnds(bs)) => Some(bs map (let(i,e,_)))
      case And(exprs) =>
        Some(exprs.flatMap(unapply).flatten)
      case e =>
        Some(Seq(e))
    }
  }

  object IsTyped {
    def unapply[T <: Typed](e: T): Option[(T, TypeTree)] = Some((e, e.getType))
  }

  /*
   * Extract a default expression and key-value pairs from a lambda constructed with
   * Constructors.finiteLambda
   */
  object FiniteLambda {
    def unapply(lambda: Lambda): Option[(Expr, Seq[(Expr, Expr)])] = {
      val inSize = lambda.getType.asInstanceOf[FunctionType].from.size
      val Lambda(args, body) = lambda
      def step(e: Expr): (Option[(Expr, Expr)], Expr) = e match {
        case IfExpr(Equals(argsExpr, key), value, default) if {
          val formal = args.map{ _.id }
          val real = unwrapTuple(argsExpr, inSize).collect{ case Variable(id) => id}
          formal == real
        } =>
          (Some((key, value)), default)
        case other =>
          (None, other)
      }

      def rec(e: Expr): (Expr, Seq[(Expr, Expr)]) = {
        step(e) match {
          case (None, default) => (default, Seq())
          case (Some(pair), default) =>
            val (defaultRest, pairs) = rec(default)
            (defaultRest, pair +: pairs)
        }
      }

      Some(rec(body))

    }
  }

  object FiniteMultiset {
    def unapply(e: Expr): Option[Seq[Expr]] = e match {
      case EmptyMultiset(_) => Some(Seq())
      case NonemptyMultiset(els) => Some(els)
      case _ => None
    }
  }

  object FiniteArray {
    def unapply(e: Expr): Option[(Map[Int, Expr], Option[Expr], Expr)] = e match {
      case EmptyArray(_) => 
        Some((Map(), None, IntLiteral(0)))
      case NonemptyArray(els, Some((default, length))) =>
        Some((els, Some(default), length))
      case NonemptyArray(els, None) =>
        Some((els, None, IntLiteral(els.size)))
      case _ => 
        None
    }
  }

  object SimpleCase {
    def apply(p : Pattern, rhs : Expr) = MatchCase(p, None, rhs)
    def unapply(c : MatchCase) = c match {
      case MatchCase(p, None, rhs) => Some((p, rhs))
      case _ => None
    }
  }
  
  object GuardedCase {
    def apply(p : Pattern, g: Expr, rhs : Expr) = MatchCase(p, Some(g), rhs)
    def unapply(c : MatchCase) = c match {
      case MatchCase(p, Some(g), rhs) => Some((p, g, rhs))
      case _ => None
    }
  }
  
  object Pattern {
    def unapply(p : Pattern) : Option[(
      Option[Identifier], 
      Seq[Pattern], 
      (Option[Identifier], Seq[Pattern]) => Pattern
    )] = Option(p) map {
      case InstanceOfPattern(b, ct)       => (b, Seq(), (b, _)  => InstanceOfPattern(b,ct))
      case WildcardPattern(b)             => (b, Seq(), (b, _)  => WildcardPattern(b))
      case CaseClassPattern(b, ct, subs)  => (b, subs,  (b, sp) => CaseClassPattern(b, ct, sp))
      case TuplePattern(b,subs)           => (b, subs,  (b, sp) => TuplePattern(b, sp))
      case LiteralPattern(b, l)           => (b, Seq(), (b, _)  => LiteralPattern(b, l))
    }
  }

  def unwrapTuple(e: Expr, isTuple: Boolean): Seq[Expr] = e.getType match {
    case TupleType(subs) if isTuple => 
      for (ind <- 1 to subs.size) yield { tupleSelect(e, ind, isTuple) }      
    case _ if !isTuple => Seq(e)
    case tp => sys.error(s"Calling unwrapTuple on non-tuple $e of type $tp")
  }
  def unwrapTuple(e: Expr, expectedSize: Int): Seq[Expr] = unwrapTuple(e, expectedSize > 1)

  def unwrapTupleType(tp: TypeTree, isTuple: Boolean): Seq[TypeTree] = tp match {
    case TupleType(subs) if isTuple => subs
    case tp if !isTuple => Seq(tp)
    case tp => sys.error(s"Calling unwrapTupleType on $tp")
  }
  def unwrapTupleType(tp: TypeTree, expectedSize: Int): Seq[TypeTree] =
    unwrapTupleType(tp, expectedSize > 1)

  def unwrapTuplePattern(p: Pattern, isTuple: Boolean): Seq[Pattern] = p match {
    case TuplePattern(_, subs) if isTuple => subs
    case tp if !isTuple => Seq(tp)
    case tp => sys.error(s"Calling unwrapTuplePattern on $p")
  }
  def unwrapTuplePattern(p: Pattern, expectedSize: Int): Seq[Pattern] =
    unwrapTuplePattern(p, expectedSize > 1)
  
  object LetPattern {
    def apply(patt : Pattern, value: Expr, body: Expr) : Expr = {
      patt match {
        case WildcardPattern(Some(binder)) => Let(binder, value, body)
        case _ => MatchExpr(value, List(SimpleCase(patt, body)))
      }
    }

    def unapply(me : MatchExpr) : Option[(Pattern, Expr, Expr)] = {
      if (me eq null) None else { me match {
        case MatchExpr(scrut, List(SimpleCase(pattern, body))) if !aliased(pattern.binders, variablesOf(scrut)) =>
          Some(( pattern, scrut, body ))
        case _ => None
      }}
    }
  }

  object LetTuple {
    def unapply(me : MatchExpr) : Option[(Seq[Identifier], Expr, Expr)] = {
      if (me eq null) None else { me match {
        case LetPattern(TuplePattern(None,subPatts), value, body) if
            subPatts forall { case WildcardPattern(Some(_)) => true; case _ => false } => 
          Some((subPatts map { _.binder.get }, value, body ))
        case _ => None
      }}
    }
  }

}
