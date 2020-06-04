//Author bluknite
import scala.io.Source

trait BaseProblem {
  private val lines: Iterator[String] = Source.fromInputStream(System.in).getLines()

  def solve(lines: Iterator[String]): String

  def main(args: Array[String]) {
    val answer: String = solve(lines)
    println(answer)
  }
}

trait TypedInput[T] {
  def convertStringToInput(s: String): T
}

trait IndividualInputs[T] extends TypedInput[T] {
  def solveParsedInputs(n: Int, inputs: List[T]): String = {
    require(n == inputs.size, s"Expected $n inputs. Actual ${inputs.size} inputs.")
    solveInputs(inputs)
  }

  val resultSeparator: String = " "

  val filterOutBlanks: Boolean = false

  def solveInputs(inputs: List[T]): String = {
    val results: List[String] = inputs.map(solveInput).map(_.toString)

    if (filterOutBlanks) results.filterNot(_ == "").mkString(resultSeparator)
    else results.mkString(resultSeparator)
  }

  def solveInput(input: T): Any
}

object ArgumentHelper {
  implicit class SeqWrapper[T](seq: Seq[T]) {
    def toPair: (T, T) = (seq(0), seq(1))
    def toTriplet: (T, T, T) = (seq(0), seq(1), seq(2))
    def toQuartet: (T, T, T, T) = (seq(0), seq(1), seq(2), seq(3))
    def toQuintet: (T, T, T, T, T) = (seq(0), seq(1), seq(2), seq(3), seq(4))
  }

  implicit class StringWrapper(string: String) {
    def toTypedSeq[T](f: (String) => T): Seq[T] = string.split(" ").map(f)
    def toTokens: Seq[String] = toTypedSeq(s => s)
    def toPair[T](f: (String) => T): (T, T) = toTypedSeq(f).toPair
    def toTriplet[T](f: (String) => T): (T, T, T) = toTypedSeq(f).toTriplet
    def toQuartet[T](f: (String) => T): (T, T, T, T) = toTypedSeq(f).toQuartet
    def toQuintet[T](f: (String) => T): (T, T, T, T, T) = toTypedSeq(f).toQuintet
    def asList[T](f: (String) => T): List[T] = toTypedSeq(f).toList
    def asTokensList: List[String] = toTokens.toList
  }
}

object TupleHelper {
  implicit class PairWrapper[T](pair: (T, T)) {
    def map[U](f: (T) => U): (U, U) = (f(pair._1), f(pair._2))
  }

  implicit class TripletWrapper[T](triplet: (T, T, T)) {
    def map[U](f: (T) => U): (U, U, U) = (f(triplet._1), f(triplet._2), f(triplet._3))
  }
}

import java.math.MathContext
import scala.annotation.tailrec

object Solution extends BaseProblem {
  val e: BigInt = 65537
  import Helper0153._

  override def solve(lines: Iterator[String]): String = {
    val n: BigInt = BigInt(lines.next())
    val cipher: BigInt = BigInt(lines.next())
    val (p, q) = n.factors
    val phiN: BigInt = n - p - q + 1
    val d = {
      implicit val modulo = Modulo(phiN)
      e.inverse
    }
    val a = {
      implicit val modulo = Modulo(n)
      cipher ^% d
    }

    @tailrec
    def decode(encoded: List[String], result: List[Char] = List()): String = encoded match {
      case head::tail =>
        if (head == "00") result.reverse.mkString
        else decode(tail, head.toInt.toChar :: result)
      case _ => ???
    }

    decode(a.toString.grouped(2).toList)
  }
}

object Helper0153 {
  case class Modulo(m: BigInt)
  implicit def moduloToBigInt(m: Modulo): BigInt = m.m

  implicit class ModularArithmeticHelper(n: BigInt)(implicit modulo: Modulo) {
    def *%(other: BigInt): BigInt = (n * other) % modulo

    def ^%(p: BigInt): BigInt = {
      @tailrec
      def exponentiate(power: BigInt, result: BigInt): BigInt =
        if (power == 0) result
        else {
          val (product, p) = closestPower(1, power, n)
          exponentiate(power - p, result *% product)
        }
      exponentiate(p, 1)
    }

    @tailrec
    private def closestPower(power: BigInt, targetPower: BigInt, result: BigInt): (BigInt, BigInt) = {
      val nextPower = 2 * power
      if (nextPower > targetPower) (result, power)
      else closestPower(nextPower, targetPower, result *% result)
    }

    @tailrec
    final def inRange: BigInt = if (n < 0) (modulo + n).inRange else n

    def inverse: BigInt = {
      val (ca, cb) = euclidean(n, modulo)
      (if (modulo > n) cb else ca).inRange
    }

    @tailrec
    private def euclidean(x: BigInt, y: BigInt, sPrev: BigInt = 1, sCurr: BigInt = 0, tPrev: BigInt = 0, tCurr: BigInt = 1): (BigInt, BigInt) =
      if (y > x) euclidean(y, x, sPrev, sCurr, tPrev, tCurr)
      else {
        val q = x / y
        val r = x % y
        if (r == 0) (sCurr, tCurr)
        else {
          val sNext = sPrev - q * sCurr
          val tNext = tPrev - q * tCurr
          euclidean(y, r, sCurr, sNext, tCurr, tNext)
        }
      }
  }

  implicit class BigIntHelper(n: BigInt) {
    private val squareRemainders = List(0, 1, 4, 5, 9, 16).map(BigInt(_))
    lazy val squared: BigInt = n.pow(2)

    lazy val sqrtCeil: BigInt = BigDecimalHelper.fromBigInt(n).squareRoot.ceiling

    lazy val factors: (BigInt, BigInt) = {
      def findFactors(a: BigInt): (BigInt, BigInt) = {
        val bsquared = a.squared - n
        if (bsquared.isPotentialSquare) {
          val b = bsquared.sqrtCeil
          val p = a + b
          val q = a - b
          if (n == p * q) (p, q) else findFactors(a + 1)
        }
        else findFactors(a + 1)
      }

      val root = if (sqrtCeil % 2 == 0) sqrtCeil + 1 else sqrtCeil

      findFactors(root)
    }

    lazy val isPotentialSquare: Boolean = squareRemainders.contains(n % 20)
  }

  implicit class BigDecimalHelper(n: BigDecimal) {
    import BigDecimalHelper._

    private lazy val round: BigDecimal = n.rounded
    lazy val ceiling: BigInt = (if (round < n) round + 1 else round).toBigInt

    lazy val squareRoot: BigDecimal = {
      @tailrec
      def computeRoot(x: BigDecimal): BigDecimal = {
        val d = n / x
        if ((x - d).abs < 0.01) x
        else computeRoot((x + d) / TWO)
      }
      computeRoot(ONE)
    }
  }
  object BigDecimalHelper {
    val mc: MathContext = new MathContext(100)
    val ONE: BigDecimal = BigDecimal(1, mc)
    val TWO: BigDecimal = BigDecimal(2, mc)

    def fromBigInt(n: BigInt): BigDecimal = BigDecimal(n, mc)
  }
}
