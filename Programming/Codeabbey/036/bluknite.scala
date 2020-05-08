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

import scala.annotation.tailrec

object Solution extends BaseProblem {

  override def solve(lines: Iterator[String]): String = {
    val n = lines.next().toInt
    val parsedGuesses: List[Guess] = lines.take(n).map(Guess(_)).toList
    val baseResult: Result = Result(parsedGuesses.head.definition.length)

    @tailrec
    def refine(guesses: List[Guess] = parsedGuesses,
               result: Result = baseResult): Result =
      if (guesses.isEmpty) result
      else {
        val ready = guesses.filter(_.ready)
        if (ready.nonEmpty) refine(
          guesses.filterNot(_.ready)
            .map(_.enhance(ready))
            .distinct
            .filterNot(_.empty),
          result.enhance(ready)
        )
        else refine((guesses ++ selfCross(guesses)).distinct, result)
      }

    refine().toString
  }

  def selfCross(guesses: List[Guess]): Seq[Guess] = {
    val cp = crossProduct(guesses)
    val useful = filterUseful(cp)
    producePossibilities(useful)
  }

  def crossProduct(guesses: List[Guess]): List[(Guess, Guess, Seq[Char])] = guesses match {
    case g :: Nil => List()
    case g :: gs => gs.map(other => (g, other, Guess.merge(g, other, (c1, c2) =>
      if (c2 == '_') '_'
      else if (c1 == c2) c1 else '_'
    ))) ++ crossProduct(gs)
  }

  def filterUseful(input: List[(Guess, Guess, Seq[Char])]): List[(Guess, Guess, Seq[Char])] =
    input.filter(p => {
      val (g1, g2, cp) = p
      val emptySlots = cp.count(_ == '_')
      (g1.answer > emptySlots) || (g2.answer > emptySlots)
    })

  def producePossibilities(input: List[(Guess, Guess, Seq[Char])]): List[Guess] =
    input.flatMap(producePossibilities)

  def producePossibilities(input: (Guess, Guess, Seq[Char])): List[Guess] = {
    def helper(guess: Guess, definition: Seq[Char], result: List[Guess]): List[Guess] =
      if (guess.answer > definition.count(_ == '_')) {
        val pDefinition = Guess.mergeDefinitions(guess.definition, definition.mkString, (c1, c2) => if (c1 == c2) '_' else c1).mkString
        val pAnswer = min(guess.answer, pDefinition.count(_ != '_'))
        Guess(pDefinition, pAnswer) :: result
      }
      else result

    val (g1, g2, cp) = input
    helper(g2, cp, helper(g1, cp, List()))
  }


  case class Guess(definition: String, answer: Int) {
    private def nonEmptyCount(d: String) = d.count(_ != '_')

    def defined: Int = nonEmptyCount(definition)

    def ready: Boolean = answer == 0 || answer == defined

    def empty: Boolean = defined == 0

    def enhance(guesses: Seq[Guess]): Guess = guesses.foldLeft(this)((g, other) => g.enhance(other))

    def enhance(that: Guess): Guess =
      if (that.answer == 0) {
        val newDefinition = Guess.merge(this, that, (c1, c2) => if (c1 == c2) '_' else c1).mkString
        val newAnswer = min(this.answer, nonEmptyCount(newDefinition))
        Guess(newDefinition, newAnswer)
      }
      else {
        val newDefinition = Guess.merge(this, that, (c1, c2) => if (c2 == '_') c1 else '_').mkString
        val newAnswer = this.answer - Guess.merge(this, that, (c1, c2) => if (c1 == c2) c1 else '_').count(_ != '_')
        Guess(newDefinition, max(newAnswer, 0))
      }

    override def toString: String = s"$definition $answer"
  }
  object Guess {
    def apply(raw: String): Guess = {
      val split = raw.split(" ")
      Guess(split(0), split(1).toInt)
    }

    def merge [T] (g1: Guess, g2: Guess, f: (Char, Char) => T): Seq[T] = mergeDefinitions(g1.definition, g2.definition, f)

    def mergeDefinitions [T] (d1: String, d2: String, f: (Char, Char) => T): Seq[T] = d1.zip(d2).map(e => f(e._1, e._2))
  }


  case class Result(definition: Seq[Digit]) {
    def enhance(guesses: Seq[Guess]): Result = guesses.foldLeft(this)((result, guess) => result.enhance(guess))
    def enhance(guess: Guess): Result = if (guess.answer == 0) remove(guess) else keep(guess)

    def remove(guess: Guess): Result = Result(definition.zip(guess.definition).map(e => {
      val (digit, c) = e
      if (c != '_') digit.remove(c.toString.toInt)
      else digit
    }))

    def keep(guess: Guess): Result = Result(definition.zip(guess.definition).map(e => {
      val (digit, c) = e
      if (c != '_') digit.keep(c.toString.toInt)
      else digit
    }))

    override def toString: String = definition.mkString
  }
  object Result {
    def apply(length: Int): Result = Result(Seq.fill(length)(Digit()))
  }


  /** Represents all possibilities for a single digit */
  case class Digit(possibilities: Seq[Int] = 0 to 9) {
    def remove(n: Int) = Digit(possibilities.filterNot(_ == n))

    def keep(n: Int) = Digit(possibilities.filter(_ == n))

    override def toString: String =
      if (possibilities.isEmpty) "_"
      else if (possibilities.size == 1) possibilities.head.toString
      else s"{${possibilities.mkString(",")}}"
  }


  def min(numbers: Int*): Int = extrema(numbers.toList, math.min)

  def max(numbers: Int*): Int = extrema(numbers.toList, math.max)

  def extrema(numbers: List[Int], f: (Int, Int) => Int): Int = {
    @tailrec
    def helper(ns: List[Int]): Int = ns match {
      case x :: y :: rest => helper(f(x, y) :: rest)
      case x :: Nil => x
      case _ => throw new IllegalArgumentException()
    }
    helper(numbers)
  }
}
