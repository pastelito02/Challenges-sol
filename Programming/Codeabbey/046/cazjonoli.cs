//Author cazjonoli
def ticTacToe():
    input = raw_input().split()
    # Converting everything to what type you would like to have it in =)
    for i in range(len(input)):
        input[i] = int(input[i])

    for i in range(len(input)/9):
        #Reseting everything that needs to be reseted!
        isX = True
        gameOver = False
        winner = ""
        board = ["1","2","3",
                "4","5","6",
                "7","8","9"]
        round = 1
        while not gameOver:
            #GET choice!
            choice = input[round-1]-1
            if isX:
                board[choice] = "X"
            else:
                board[choice] = "O"

            #Reversing turn!
            isX = not isX

            #Checking if game is over!
            if (board[0] == "X" and board[1] == "X" and board[2] == "X") or (board[3] == "X" and board[4] == "X" and board[5] == "X") or (board[6] == "X" and board[7] == "X" and board[8] == "X") or (board[0] == "X" and board[3] == "X" and board[6] == "X") or (board[1] == "X" and board[4] == "X" and board[7] == "X") or (board[2] == "X" and board[5] == "X" and board[8] == "X") or (board[0] == "X" and board[4] == "X" and board[8] == "X") or (board[2] == "X" and board[4] == "X" and board[6] == "X"):
                gameOver = True
                winner = "X"
            elif (board[0] == "O" and board[1] == "O" and board[2] == "O") or (board[3] == "O" and board[4] == "O" and board[5] == "O") or (board[6] == "O" and board[7] == "O" and board[8] == "O") or (board[0] == "O" and board[3] == "O" and board[6] == "O") or (board[1] == "O" and board[4] == "O" and board[7] == "O") or (board[2] == "O" and board[5] == "O" and board[8] == "O") or (board[0] == "O" and board[4] == "O" and board[8] == "O") or (board[2] == "O" and board[4] == "O" and board[6] == "O"):
                gameOver = True
                winner = "O"
            elif board[0] != "1" and board[1] != "2" and board[2] != "3" and board[3] != "4" and board[4] != "5" and board[5] != "6" and board[6] != "7" and board[7] != "8" and board[8] != "9":
                gameOver = True
                winner = "no one"
            round += 1
        #END of game loop!

        #How many rounds it took for someone to win!
        if winner == "no one":
            round = 1
        print round-1
        for i in range(9):
            input.pop(0)











ticTacToe()