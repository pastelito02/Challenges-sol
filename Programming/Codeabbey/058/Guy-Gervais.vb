'Author Guy Gervais
Sub Main
    dim input = "22 17 8 18 34 33 19 0 25 21 44 15 29 12 23 13 39 4 26 49 46 27"    
    dim suits = {"Clubs", "Spades", "Diamonds", "Hearts"}
    dim ranks = {"2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"}
    dim deck = (from s in suits from r in ranks select r & "-of-" & s & " ") 
    input.split(" "c).tolist.foreach(sub(x) debug.write(deck(x)))
End Sub