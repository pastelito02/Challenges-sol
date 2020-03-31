#Author chrisdfrey
encoding = {}

def get_encoding(freqs, prefix=""):
    global encoding

    num_chars = len(freqs)

    if (num_chars == 1):
        encoding[freqs[0][0]] = prefix

        return

    split_i = None
    min_diff = None

    for i in xrange(1,num_chars):
        left_sum = 0
        right_sum = 0
        for j in xrange(num_chars):
            if (j < i):
                left_sum += freqs[j][1]
            else:
                right_sum += freqs[j][1]

        diff = abs(left_sum - right_sum)
        if (min_diff is None) or (diff < min_diff):
            split_i = i
            min_diff = diff
        else:
            break

    get_encoding(freqs[:split_i], (prefix + "O"))
    get_encoding(freqs[split_i:], (prefix + "I"))

f = open("input.txt")

text = f.readline().strip()

char_freq = {}

for char in text:
    if char not in char_freq:
        char_freq[char] = 1
    else:
        char_freq[char] += 1

freqs = char_freq.items()

def freq_comparer(x,y):
    if x[1] > y[1]:
        return -1
    elif x[1] < y[1]:
        return 1
    elif x[0] < y[0]:
        return -1
    elif x[0] > y[0]:
        return 1
    else:
        return 0

freqs = sorted(freqs,cmp=freq_comparer)

get_encoding(freqs)

outputs = []
for f in freqs:
    output = str(ord(f[0])) + " " + encoding[f[0]]
    outputs.append(output)

print (" ".join(outputs))
