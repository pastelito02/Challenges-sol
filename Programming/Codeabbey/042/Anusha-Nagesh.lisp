;Author Anusha Nagesh
if __name__ == "__main__":
    answerSet= []
    for _ in range(int(input())):
        morethanoneA = False
        points = 0
        NumberList = list(input().split())
        NumberList.sort()
        #print (*NumberList)
        firstEncounter = False
        if ('A' in NumberList):
            NumberList.append(NumberList.pop(NumberList.index('A')))
            
        for i in NumberList:
            if i == 'A' and firstEncounter == False:
                #print ("first Encounter False {}".format(points))
                firstEncounter = True
                #print (points+11)
                if (points + 11) > 21:
                    #print ("Points exceed 21")
                    points += 1
                else:
                    points += 11
            elif i == 'A' and firstEncounter == True:
                points += 1
            elif i in ('T','J', 'Q', 'K'):
                points += 10
            else:
                points += int(i)
        if points > 21:
            #print (points)
            points = 'Bust'
        answerSet.append(points)
    print (*answerSet)
    
            
    