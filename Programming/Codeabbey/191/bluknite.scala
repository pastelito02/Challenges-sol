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

trait MultiLineInputs[T] extends BaseProblem with IndividualInputs[T] {
  override def solve(lines: Iterator[String]): String = {
    val n = lines.next().toInt

    def readNLines(n: Int = n, result: List[T] = List()): List[T] =
      if (n == 0) result.reverse
      else readNLines(n - 1, convertStringToInput(lines.next()) :: result)

    val inputs: List[T] = readNLines()

    solveParsedInputs(n, inputs)
  }
}

import scala.annotation.tailrec

object Solution extends MultiLineInputs[String] {
  override def convertStringToInput(s: String): String = s

  override def solveInput(input: String): Any = {
    val digits = input.asIntList
    s"${swapForSmallest(digits).asString} ${swapForLargest(digits).asString}"
  }

  def swapForSmallest(numbers: List[Int]): List[Int] = swapForBest(numbers, minCandidate)
  def swapForLargest(numbers: List[Int]): List[Int] = swapForBest(numbers, maxCandidate)

  private def swapForBest(numbers: List[Int],
                  bestCandidateFunction: (Int, List[Int]) => Option[(Int, Int)]): List[Int] = {
    @tailrec
    def swapBest(init: List[Int], numbers: List[Int]): List[Int] =
      if (numbers.isEmpty) init.reverse
      else {
        val head = numbers.head
        val tail = numbers.tail
        bestCandidateFunction(head, tail) match {
          case None => swapBest(head :: init, tail)
          case Some((candidate, index)) =>
            val (beforeSplit, atSplit) = tail.splitAt(index)
            init.reverse ::: candidate :: beforeSplit ::: head :: atSplit.tail
        }
      }

    swapBest(List(), numbers)
  }

  def minCandidate(n: Int, numbers: List[Int]): Option[(Int, Int)] =
    bestCandidate(n, numbers, p => p._1 > 0 && p._1 < n, _.minBy(_._1))
  def maxCandidate(n: Int, numbers: List[Int]): Option[(Int, Int)] =
    bestCandidate(n, numbers, _._1 > n, _.maxBy(_._1))

  private def bestCandidate(n: Int, numbers: List[Int],
                    isCandidate: ((Int, Int)) => Boolean,
                    getBestValue: (List[(Int, Int)]) => (Int, Int)): Option[(Int, Int)] = {
    val candidates = numbers.zipWithIndex.filter(isCandidate)
    if (candidates.isEmpty) None
    else {
      val bestValue = getBestValue(candidates)._1
      Some(candidates.filter(_._1 == bestValue).maxBy(_._2))
    }
  }

  private implicit class CharHelper(c: Char) {
    def between(min: Char, max: Char): Boolean = c >= min && c <= max

    lazy val int: Int =
      if (c.between('0', '9')) c - '0'
      else if (c.between('a', 'f')) 10 + c - 'a'
      else ???
  }

  private implicit class StringHelper(s: String) {
    lazy val asIntList: List[Int] = s.map(_.toLower.int).toList
  }

  private implicit class IntListHelper(list: List[Int]) {
    lazy val asString: String = list.map(_.char).mkString
  }

  private implicit class IntHelper(i: Int) {
    def between(min: Int, max: Int): Boolean = i >= min && i <= max

    lazy val char: Char =
      if (i.between(0, 9)) ('0' + i).toChar
      else if (i.between(10, 15)) ('A' + i - 10).toChar
      else ???
  }
}