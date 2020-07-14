class MovieC {
    public static function movie(card: Int, ticket: Int, percent: Float): Int {
        var pb: Float = ticket, sa = 0.0, sb = 0.0;
        var i = 0;
        while (Math.ceil(sa) <= Math.ceil(card + sb)) {
            pb *= percent;
            sa += ticket;
            sb += pb;
            i++;
        }
        return i;
    }
}
