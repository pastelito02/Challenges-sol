#Author jlancherosn
def separaletras(palabras):
  lista=[]
  for i in palabras:
  if(str.isalpha(i)==True):
    lista.append(i)
  else:
    lista.append('')
  return(lista)

def palindromas(entrada1):
  solucion=[]
  for i in range(entrada1):
  lista=separaletras(raw_input().lower())
  lista=''.join(lista)
  if(lista==lista[::-1]):
    solucion.append('Y')
  else:
    solucion.append('N')
  print(' '.join(solucion))

palindromas(int(input()))
