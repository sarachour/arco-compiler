/* Copyright 2009-2015 EPFL, Lausanne */

package leon
package solvers
package combinators

import purescala.Common._
import purescala.Expressions._
import verification.VC

import utils.Interruptible
import scala.concurrent._
import scala.concurrent.duration._

import ExecutionContext.Implicits.global

class PortfolioSolver[S <: Solver with Interruptible](val context: LeonContext, val solvers: Seq[SolverFactory[S]])
        extends Solver with Interruptible {

  val name = "Pfolio"

  var constraints = List[Expr]()

  protected var modelMap = Map[Identifier, Expr]()
  protected var solversInsts: Seq[S] = solvers.map(_.getNewSolver())

  def assertCnstr(expression: Expr): Unit = {
    solversInsts.foreach(_.assertCnstr(expression))
  }

  override def assertVC(vc: VC): Unit = {
    solversInsts.foreach(_.assertVC(vc))
  }

  def check: Option[Boolean] = {
    modelMap = Map()

    context.reporter.debug("Running portfolio check")
    // solving
    val fs = solversInsts.map { s =>
      Future {
        val result = s.check
        val model: Map[Identifier, Expr] = if (result == Some(true)) {
          s.getModel
        } else {
          Map()
        }
        (s, result, model)
      }
    }

    val result = Future.find(fs)(_._2.isDefined)

    val res = Await.result(result, 10.days) match {
      case Some((s, r, m)) =>
        modelMap = m
        context.reporter.debug("Solved with "+s.name)
        solversInsts.foreach(_.interrupt())
        r
      case None =>
        None
    }

    fs map { Await.ready(_, 10.days) }
    res
  }

  def free() = {
    solversInsts.foreach(_.free)
    solversInsts = Nil
    modelMap = Map()
    constraints = Nil
  }

  def getModel: Map[Identifier, Expr] = {
    modelMap
  }

  def interrupt(): Unit = {
    solversInsts.foreach(_.interrupt())
  }

  def recoverInterrupt(): Unit = {
    solversInsts.foreach(_.recoverInterrupt())
  }
}
