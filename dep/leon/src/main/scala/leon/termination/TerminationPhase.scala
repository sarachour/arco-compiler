/* Copyright 2009-2015 EPFL, Lausanne */

package leon
package termination

import purescala.Definitions._
import purescala.DefOps._

object TerminationPhase extends LeonPhase[Program,TerminationReport] {
  val name = "Termination"
  val description = "Check termination of PureScala functions"

  def run(ctx : LeonContext)(program : Program) : TerminationReport = {
    val startTime = System.currentTimeMillis

//    val tc = new SimpleTerminationChecker(ctx, program)
    val tc = new ComplexTerminationChecker(ctx, program)

    def excludeByDefault(fd: FunDef): Boolean = fd.annotations contains "library"

    val fdFilter = {
      import OptionsHelpers._

      filterInclusive(ctx.findOption(SharedOptions.optFunctions).map(fdMatcher), Some(excludeByDefault _))
    }

    val toVerify = tc.program.definedFunctions.filter(fdFilter).sortWith((fd1, fd2) => fd1.getPos < fd2.getPos)

    val results = toVerify.map { funDef =>
      funDef -> tc.terminates(funDef)
    }
    val endTime = System.currentTimeMillis

    new TerminationReport(results, (endTime - startTime).toDouble / 1000.0d)
  }
}
