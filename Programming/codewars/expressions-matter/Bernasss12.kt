/*Bernasss12*/
class Kata {
    companion object {
        fun expressionsMatter(a : Int, b : Int, c : Int) = intArrayOf(a + b + c, a + b * c, a * b * c, a * b + c, (a + b) * c, a * (b + c)).max()
    }
}
