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

trait SplitSingleLineInputs[T] extends BaseProblem with IndividualInputs[T] {
  override def solve(lines: Iterator[String]): String = {
    val n = lines.next().toInt
    val inputs: List[T] = lines.next().split(delimiter).map(convertStringToInput).toList

    solveParsedInputs(n, inputs)
  }

  val delimiter: String = " "
}

import Helper0088._
import math._

object Solution extends SplitSingleLineInputs[Note] {
  override def convertStringToInput(s: String): Note = Note(s)

  override def solveInput(note: Note): Any = round(note.frequency)
}

object Helper0088 {
  case class Note(octave: Int, notation: String) {
    import Note._
    lazy val pitch: Int = pitchFor(notation)
    lazy val frequency: Double = {
      val octaveDifference: Double = octave - a4.octave
      val pitchDifference: Double = pitch - a4.pitch
      val pitchSteps = octaveDifference + (pitchDifference / 12)
      a4Frequency * pow(2, pitchSteps)
    }

    override def toString: String = s"$notation$octave"
  }
  object Note {
    val a4: Note = Note("A4")
    val a4Frequency: Double = 440
    private val pitches: Map[String, Int] = Map(
      "C"  -> 1,
      "C#" -> 2,
      "D"  -> 3,
      "D#" -> 4,
      "E"  -> 5,
      "F"  -> 6,
      "F#" -> 7,
      "G"  -> 8,
      "G#" -> 9,
      "A"  -> 10,
      "A#" -> 11,
      "B"  -> 12
    )

    def apply(s: String): Note = {
      val note: String = s.dropRight(1)
      val octave: Int = s.takeRight(1).toInt
      Note(octave, note)
    }

    def pitchFor(notation: String): Int = pitches.get(notation) match {
      case Some(p) => p
      case None => ???
    }
  }
}