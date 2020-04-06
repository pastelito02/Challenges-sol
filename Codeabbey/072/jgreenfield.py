#Author jgreenfield
consonants = 'bcdfghjklmnprstvwxz'
vowels = 'aeiou'
line1 = raw_input().split(' ')
num_items = int(line1[0])
seed = int(line1[1])

data = list(map(int, raw_input().rstrip().split()))

def get_vowel(num):
    return vowels[num % len(vowels)]

def get_cons(num):
    return consonants[num % len(consonants)]
def calc_num(num):
    return ((445 * num) + 700001) % 2097152


def calc_word(length):
    global seed
    t = 0
    word = ''
    while t < length:
        seed = calc_num(seed)
        if t % 2 == 0:
            word = word + get_cons(seed)
        else:
            word = word + get_vowel(seed)
        t += 1
    return word



totals = []
i = 0
try:
    while i < num_items:
        totals.append(calc_word(data[i]))
        i += 1
except MemoryError:
    print "Mem Error"
print(' '.join(map(str, totals)).replace(",", " ").strip(";"))
