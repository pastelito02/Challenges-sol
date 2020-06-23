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

import ArgumentHelper._

import scala.annotation.tailrec

object Solution extends BaseProblem {
  override def solve(lines: Iterator[String]): String = {
    val (w, h) = lines.next().toPair(_.toInt)
    val maze = Maze(lines, h, w)
    val end = Position(0, 0)
    val startingPositions = List(Position(0, w - 1), Position(h - 1, 0), Position(h - 1, w - 1))
    startingPositions.map(start => maze.findPath(start, end)).mkString(" ")
  }

  case class Maze(passages: List[Position]) {
    def computePath(start: Position, end: Position): List[Position] = {
      @tailrec
      def crawl(positions: List[Position], maze: Maze, map: Map[Position, Position] = Map()): Map[Position, Position] = {
        val withNeighbors = positions.map(p => (p, maze.getNeighbors(p))).filter(_._2.nonEmpty)
        val withParents = withNeighbors.flatMap(pair => {
          val (p, neighbors) = pair
          neighbors.map(n => (n, p))
        })
        val newPositions = withNeighbors.flatMap(_._2)
        val newMaze = maze.withoutPositions(newPositions)
        if (newMaze.isEmpty) map ++ withParents
        else crawl(newPositions, newMaze, map ++ withParents)
      }

      val crawlMap = crawl(List(start), this.withoutPosition(start))
      @tailrec
      def tracePath(currentPosition: Position, result: List[Position] = List()): List[Position] = {
        val parent = crawlMap.get(currentPosition)
        if (parent.isDefined) tracePath(parent.get, currentPosition :: result)
        else currentPosition :: result
      }

      tracePath(end)
    }

    def computeDirections(start: Position, end: Position): List[String] = {
      val path: List[Position] = computePath(start, end)
      path.zip(path.tail).map(pair => pair._1.directionTo(pair._2))
    }

    def findPath(start: Position, end: Position): String = {
      @tailrec
      def compressDirections(directions: List[String], currentDirection: String, count: Int, result: String): String =
        if (directions.isEmpty) s"$result$count$currentDirection"
        else {
          val head = directions.head
          if (head == currentDirection) compressDirections(directions.tail, currentDirection, count + 1, result)
          else compressDirections(directions.tail, head, 1, s"$result$count$currentDirection")
        }
      val directions: List[String] = computeDirections(start, end)
      compressDirections(directions.tail, directions.head, 1, "")
    }

    def withoutPosition(position: Position): Maze = withoutPositions(List(position))

    def withoutPositions(positions: List[Position]): Maze = Maze(passages.filterNot(positions.contains))

    def getNeighbors(position: Position): List[Position] =
      List(position.left, position.right, position.up, position.down).intersect(passages)

    lazy val isEmpty: Boolean = passages.isEmpty
  }

  object Maze {
    def apply(lines: Iterator[String], rows: Int, columns: Int): Maze = {
      @tailrec
      def readLines(r: Int = 0, result: List[Position] = List()): List[Position] =
        if (r == rows) result
        else readLines(r + 1, lines.next().zipWithIndex.filter(_._1 == '1').map(e => Position(r, e._2)).toList ::: result)
      Maze(readLines())
    }
  }

  case class Position(row: Int, column: Int) {
    lazy val left: Position = Position(row, column - 1)
    lazy val right: Position = Position(row, column + 1)
    lazy val up: Position = Position(row - 1, column)
    lazy val down: Position = Position(row + 1, column)

    def directionTo(p: Position): String =
      if (left == p) "L"
      else if (right == p) "R"
      else if (up == p) "U"
      else "D"
  }
}