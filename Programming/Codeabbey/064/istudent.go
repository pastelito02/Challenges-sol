//Author istudent
type point struct {
    x, y int
}

func mazePathfinder() {
    var width, height, r = 0, 0, '\x00'
    fmt.Scanf("%d %d\n", &width, &height) // считываем ширину и высоту лабиринта
    maze := make([][]int, height)
    for i := 0; i < height; i++ {
        row := make([]int, width)
        for j := 0; j < width; j++ { // для заданного количества элементов в строке
            fmt.Scanf("%c", &r)  // считываем по одному элементу в руну
            row[j] = int(r) - 48 // и кладем в массив (ASCII-код "0" и "1" - 48 и 49 соответственно)
        }
        maze[i] = row // получившуюся строку записываем на нужную позицию в двумерном массиве
        fmt.Scanln()  // переводим строку
    }
    for _, currPoint := range []point{point{width - 1, 0}, point{0, height - 1}, point{width - 1, height - 1}} { // для точек A, B, C
        fmt.Printf("%s ", shortForm(newStep(maze, map[int]string{0: "L", 1: "R", 2: "U", 3: "D"}, point{}, currPoint, width, height))) // мапа содержит направление возможных шагов в лабиринте согласно порядку возможных соседей заданной точки в массиве в функции newStep
    }
}

func newStep(maze [][]int, step map[int]string, prevPoint, currPoint point, width, height int) string {
    for i, nextPoint := range []point{point{currPoint.x - 1, currPoint.y}, point{currPoint.x + 1, currPoint.y}, point{currPoint.x, currPoint.y - 1}, point{currPoint.x, currPoint.y + 1}} { // для всевозможных соседей заданной точки
        if ((nextPoint.x > -1 && nextPoint.x < width && i < 2) || (nextPoint.y > -1 && nextPoint.y < height && i > 1)) && (nextPoint != prevPoint) && (maze[nextPoint.y][nextPoint.x] == 1) { // проверяем, что координаты соседней точки не выходят за пределы лабиринта, что они не равняются координатам предыдущего шага, что в значение элемента массива с данными координатами равняется 1
            if nextPoint.x == 0 && nextPoint.y == 0 { // если мы достигли выхода, то возвращаем направление последнего шага
                return step[i]
            }
            if res := newStep(maze, step, currPoint, nextPoint, width, height); res != "" { // в противном случае рекурсивно вызываем эту же функцию, и если она не вернула пустую строку (тупик)
                return step[i] + res // то возвращаем текущий шаг + результат функции
            }
        }
    }
    return ""
}

func shortForm(steps string) (short string) {
    var prevLetter, counter = "", 0
    for i := range steps {
        if steps[i:i+1] != prevLetter {
            short, prevLetter, counter = short+strconv.Itoa(counter)+prevLetter, steps[i:i+1], 1
        } else {
            counter++
        }
    }
    return (short + strconv.Itoa(counter) + prevLetter)[1:]
}