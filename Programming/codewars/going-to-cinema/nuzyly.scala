//nuzyly
import scala.annotation.tailrec

object Movie {

  def movie(card: Int, ticket: Int, perc: Double): Int = {

    @tailrec
    def countVisits(n: Int, priceA: Int, priceB: Double, memberTicket: => Double): Int = {
      if (math.ceil(priceB) < priceA) n
      else countVisits(n + 1, priceA + ticket, priceB + memberTicket, memberTicket * perc)
    }
    countVisits(0, 0, card, ticket * perc)
  }
}
