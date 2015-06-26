package leon
package solvers

import purescala.Types._
import purescala.TypeOps._
import purescala.Common._

case class DataType(sym: Identifier, cases: Seq[Constructor]) {
  def asString(implicit ctx: LeonContext) = {
    "Datatype: "+sym.asString+"\n"+cases.map(c => " - "+c.asString(ctx)).mkString("\n")
  }
}
case class Constructor(sym: Identifier, tpe: TypeTree, fields: Seq[(Identifier, TypeTree)]) {
  def asString(implicit ctx: LeonContext) = {
    sym.asString(ctx)+" ["+tpe.asString(ctx)+"] "+fields.map(f => f._1.asString(ctx)+": "+f._2.asString(ctx)).mkString("(", ", ", ")")
  }
}

class ADTManager(ctx: LeonContext) {
  val reporter = ctx.reporter

  protected def freshId(id: Identifier): Identifier = freshId(id.name)
  protected def freshId(name: String): Identifier = FreshIdentifier(name)

  protected def getHierarchy(ct: ClassType): (ClassType, Seq[CaseClassType]) = ct match {
    case act: AbstractClassType =>
      (act, act.knownCCDescendents)
    case cct: CaseClassType =>
      cct.parent match {
        case Some(p) =>
          getHierarchy(p)
        case None =>
          (cct, List(cct))
      }
  }

  protected var defined = Set[TypeTree]()
  protected var locked  = Set[TypeTree]()

  protected var discovered = Map[TypeTree, DataType]()

  def defineADT(t: TypeTree): Either[Map[TypeTree, DataType], Set[TypeTree]] = {
    discovered = Map()
    locked     = Set()

    findDependencies(t)

    val conflicts = discovered.keySet & locked

    if (conflicts(t)) {
      // There is no way to solve this, the type we requested is in conflict
      reporter.warning("Encountered ADT '"+t+"' that can't be defined.")
      reporter.warning("It appears it has recursive references through non-structural types (such as arrays, maps, or sets).")
      throw new IllegalArgumentException
    } else {
      // We might be able to define some despite conflicts
      if (conflicts.isEmpty) {
        for ((t, dt) <- discovered) {
          defined += t
        }
        Left(discovered)
      } else {
        Right(conflicts)
      }
    }
  }

  def forEachType(t: TypeTree)(f: TypeTree => Unit): Unit = t match {
    case NAryType(tps, builder) =>
      f(t)
      tps.foreach(forEachType(_)(f))
  }

  protected def findDependencies(t: TypeTree): Unit = t match {
    case _: SetType | _: MapType =>
      forEachType(t) { tpe =>
        if (!defined(tpe)) {
          locked += tpe
        }
      }

    case ct: ClassType =>
      val (root, sub) = getHierarchy(ct)

      if (!(discovered contains root) && !(defined contains root)) {
        val sym = freshId(ct.id)

        val conss = sub.map { case cct =>
          Constructor(freshId(cct.id), cct, cct.fields.map(vd => (freshId(vd.id), vd.getType)))
        }

        discovered += (root -> DataType(sym, conss))

        // look for dependencies
        for (ct <- root +: sub; f <- ct.fields) {
          findDependencies(f.getType)
        }
      }

    case tt @ TupleType(bases) =>
      if (!(discovered contains t) && !(defined contains t)) {
        val sym = freshId("tuple"+bases.size)

        val c = Constructor(freshId(sym.name), tt, bases.zipWithIndex.map {
          case (tpe, i) => (freshId("_"+(i+1)), tpe)
        })

        discovered += (tt -> DataType(sym, Seq(c)))

        for (b <- bases) {
          findDependencies(b)
        }
      }

    case UnitType =>
      if (!(discovered contains t) && !(defined contains t)) {

        val sym = freshId("Unit")

        discovered += (t -> DataType(sym, Seq(Constructor(freshId(sym.name), t, Nil))))
      }

    case at @ ArrayType(base) =>
      if (!(discovered contains t) && !(defined contains t)) {
        val sym = freshId("array")

        val c = Constructor(freshId(sym.name), at, List(
          (freshId("size"), Int32Type),
          (freshId("content"), RawArrayType(Int32Type, base))
        ))

        discovered += (at -> DataType(sym, Seq(c)))

        findDependencies(base)
      }

    case _ =>
  }
}
