//g964
package going

fun movie(card:Int, ticket:Int, perc:Double):Int {
    var systemA = 0
    var systemB = card.toDouble()
    var prev = ticket.toDouble()
    var times = 0
    while (systemA <= Math.ceil(systemB))
    {
      systemA += ticket
      prev *= perc
      systemB += prev
      times += 1
    }
    return times
}
