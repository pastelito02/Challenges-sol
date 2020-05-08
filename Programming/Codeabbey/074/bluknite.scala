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
  }

  implicit class StringWrapper(string: String) {
    def toTypedSeq[T](f: (String) => T): Seq[T] = string.split(" ").map(f)
    def toTokens: Seq[String] = toTypedSeq(s => s)
    def toPair[T](f: (String) => T): (T, T) = toTypedSeq(f).toPair
    def toTriplet[T](f: (String) => T): (T, T, T) = toTypedSeq(f).toTriplet
    def toQuartet[T](f: (String) => T): (T, T, T, T) = toTypedSeq(f).toQuartet
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

trait SplitSingleLineInputs[T] extends BaseProblem with IndividualInputs[T] {
  override def solve(lines: Iterator[String]): String = {
    val n = lines.next().toInt
    val inputs: List[T] = lines.next().split(delimiter).map(convertStringToInput).toList

    solveParsedInputs(n, inputs)
  }

  val delimiter: String = " "
}

import java.text.DecimalFormat

object Solution extends SplitSingleLineInputs[Time] {
  override def convertStringToInput(s: String): Time = {
    val raw: Array[Int] = s.split(":").map(_.toInt)
    Time(raw(0) % 12, raw(1))
  }

  override def solveInput(time: Time): Any = {
    val coordinates = List(
      PolarCoordinate(hourLength, time.hourAngle),
      PolarCoordinate(minuteLength, time.minuteAngle)
    )

    val origin = CartesianCoordinate(10, 10)

    coordinates.map(_.asCartesianCoordinate.translate(origin)).mkString(" ")
  }

  val minuteLength: Double = 9
  val hourLength: Double = 6
}

case class Time(hour: Int, minute: Int) {
  private val ninety: Double = math.Pi / 2
  private val minuteIncrement: Double = 2*math.Pi / 60
  private val hourIncrement: Double = 2*math.Pi / 12
  private val minuteIncrementForHour: Double = hourIncrement / 60

  def normalizeAngle(rawAngle: Double): Double = ninety - rawAngle

  lazy val minuteAngle: Double = normalizeAngle(minute * minuteIncrement)

  lazy val hourAngle: Double =
    normalizeAngle((hour * hourIncrement) + (minute * minuteIncrementForHour))
}

case class PolarCoordinate(radius: Double, angle: Double) {
  lazy val asCartesianCoordinate: CartesianCoordinate = CartesianCoordinate(
    radius * math.cos(angle),
    radius * math.sin(angle)
  )
}

case class CartesianCoordinate(x: Double, y: Double) {
  val formatter = new DecimalFormat("0.0#######")

  def translate(that: CartesianCoordinate): CartesianCoordinate =
    CartesianCoordinate(this.x + that.x, this.y + that.y)

  override def toString: String = s"${formatter.format(x)} ${formatter.format(y)}"
}
