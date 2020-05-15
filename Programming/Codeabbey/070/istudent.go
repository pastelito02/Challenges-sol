//Author istudent
func mostFrequentWord() {
    consonant, vowels := "bcdfghjklmnprstvwxz", "aeiou"
    var seed int
    var numberOfWords, a, m, c = 900000, 445, 2097152, 700001
    var mapOfWordFrequency = make(map[string]int)
    var maxFreq int
    var popularWord string
    fmt.Scanf("%d\n", &seed)
    for i := 0; i < numberOfWords; i++ {
        var numberOfLetters = 6
        var word string
        for j := 0; j < numberOfLetters; j++ {
            seed = (a*seed + c) % m
            switch {
            case j%2 == 0:
                word += consonant[seed%19 : seed%19+1]
            default:
                word += vowels[seed%5 : seed%5+1]
            }
        }
        freq, ok := mapOfWordFrequency[word]
        if ok {
            freq++
            mapOfWordFrequency[word] += freq
            if freq > maxFreq {
                maxFreq = freq
                popularWord = word
            }
        } else {
            mapOfWordFrequency[word] = 1
        }
    }
    fmt.Printf("%s ", popularWord)
}