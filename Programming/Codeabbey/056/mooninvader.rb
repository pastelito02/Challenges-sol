#Author mooninvader
nb_line = 5
nb_cols = 7

grid = [[0 for _ in range(2*nb_cols)] for _ in range(2*nb_line)]
padding_x = (len(grid[0]) - nb_cols) // 2
padding_y = (len(grid) - nb_line) // 2

list_cells = []


def neighbors(cell):
    _i = cell[0]
    _j = cell[1]
    result = []
    for i in range(_i - 1, _i + 2):
        for j in range(_j - 1, _j + 2):
            if (0 < i < len(grid)) and (0 < j < len(grid[i])) and grid[i][j] == 0:
                result.append([i, j])
    return result


def nb_neighbors(cell, value):
    result = 0
    _i = cell[0]
    _j = cell[1]
    for i in range(_i - 1, _i + 2):
        for j in range(_j - 1, _j + 2):
            if (0 < i < len(grid)) and (0 < j < len(grid[i])) and not (i == _i and j == _j) and grid[i][j] == value:
                result += 1
    return result


def advance():
    visited_cells = []
    dying_cells = []
    born_cells = []
    for cell in list_cells:
        if cell not in visited_cells:
            visited_cells.append(cell)
            nb_living_neighbors = nb_neighbors(cell, 1)
            if nb_living_neighbors < 2 or nb_living_neighbors > 3:
                dying_cells.append(cell)

            for neighbor in neighbors(cell):
                if neighbor not in visited_cells:
                    visited_cells.append(neighbor)
                    nb_living_neighbors = nb_neighbors(neighbor, 1)
                    if nb_living_neighbors == 3:
                        born_cells.append(neighbor)

    list_cells.extend(born_cells)

    for e in born_cells:
        grid[e[0]][e[1]] = 1

    for e in dying_cells:
        if e in list_cells:
            list_cells.remove(e)
            grid[e[0]][e[1]] = 0

    return len(list_cells)


def print_grid():
    for i in range(nb_line):
        for j in range(nb_cols):
            if grid[i + padding_x][j + padding_y] == 0:
                print('-', end='')
            else:
                print('X', end='')
        print('')


for i in range(nb_line):
    items = input()
    for j in range(nb_cols):
        if items[j] == 'X':
            grid[i + padding_x][j + padding_y] = 1
            list_cells.append([i + padding_x, j + padding_y])

result =[]
for _ in range(5):
    result.append(advance())

print(' '.join(str(i) for i in result))

