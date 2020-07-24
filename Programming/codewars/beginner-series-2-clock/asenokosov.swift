/*asenokosov*/
func past(_ h: Int, _ m: Int, _ s: Int) -> Int {
    let hour = h * 3600000
    let minutes = m * 60000
    let seconds = s * 1000
    return hour + minutes + seconds
}
