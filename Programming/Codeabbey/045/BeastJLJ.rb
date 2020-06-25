#Author BeastJLJ
def GetInputNumbers()
    aNumbers = []
    aStringNumbers = gets.chomp.split(" ")
    for nIndex in 0...aStringNumbers.length
        aNumbers << aStringNumbers[nIndex].to_i
    end
    return aNumbers
end
def Swap(aDeck, nIndex1, nIndex2)
    sTemporary = aDeck[nIndex1]
    aDeck[nIndex1] = aDeck[nIndex2]
    aDeck[nIndex2] = sTemporary
end
def Shuffle(aIndices)
    aDeck = []
    aRanks = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "T", "J", "Q", "K"]
    aSuits = ["C", "D", "H", "S"]
    aSuits.each { |sSuit| aRanks.each { |sRank| aDeck << sSuit + sRank } }
    for nIndex in 0..51
        Swap(aDeck, nIndex, aIndices[nIndex] % 52)
    end
    return aDeck
end
Shuffle(GetInputNumbers()).each { |sCard| print sCard + " " }
puts