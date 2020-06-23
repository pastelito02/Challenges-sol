#Author BlackSpirit
def prepareTable(rows, columns):
    table = []
    for i in range(rows):
        table.append([])
        for j in range(columns):
            table[i].append(0)
    return table

def calculatePaths(input, rows, columns):
    table = prepareTable(rows, columns)
    table[0][0] = 1
    for i in range(rows):
        for j in range(columns):
            if (input[i][j] == 'X'):
                continue
            if (i + 1 < rows):
                if (input[i + 1][j] != 'X'):
                    table[i + 1][j] += table[i][j]
            if (j + 1 < columns):
                if (input[i][j + 1] != 'X'):
                    table[i][j + 1] += table[i][j]
    return table[rows - 1][columns - 1]
    
def main():
    rows, columns = map(int, raw_input().split())
    input = []
    for i in range(rows):
        input.append(raw_input().split())
    result = calculatePaths(input, rows, columns)
    print result

if __name__ == '__main__':
    main()
