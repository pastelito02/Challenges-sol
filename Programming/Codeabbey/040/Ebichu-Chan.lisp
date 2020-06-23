;Author Ebichu Chan
# data as str
filas = int(data.split()[0])
columnas = int(data.split()[1])
tablero = [fila.split() for fila in data.split("\n")[2:]]

matriz_Caminos = list(tablero)
matriz_Caminos[0][0] = 1

def calcular_matriz_caminos():
    for y, fila in enumerate(matriz_Caminos):
        for x, elemento in enumerate(fila):
            if elemento == 'X':
                matriz_Caminos[y][x] = 0
                
            if elemento == '+' or elemento == '$':
                arriba = valor_arriba(x, y)
                izquierda = valor_izquierda(x, y)
                matriz_Caminos[y][x] = arriba + izquierda


def pon(matriz):
    for fila in matriz:
        print(*fila)            
    print()
    
def valor_arriba(x, y):
    if y == 0:
        return 0
    if y > 0:
        return matriz_Caminos[y-1][x]
        
def valor_izquierda(x, y):
    if x == 0:
        return 0
    if x > 0:
        return matriz_Caminos[y][x-1]

calcular_matriz_caminos()
print(matriz_Caminos[-1][-1]
