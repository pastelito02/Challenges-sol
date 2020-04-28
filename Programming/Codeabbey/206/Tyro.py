#Author Tyro
ALPHA = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ234567'

num = int(raw_input())

def pad_five(binary):
    out = binary[2:]
    while len(out) < 5:
        out = '0' + out
    return out

def pad_octet(c):
    out = bin(ord(c))[2:]
    while len(out) < 8:
        out = '0' + out
    return out

def encode(text):
    to_pad = 5 - (len(text) % 5)
    text += '{}'.format(to_pad) * to_pad
    encoded = ''
    octet_text = []
    for c in text:
        octet_text.append(pad_octet(c))
    for i in xrange(0, len(octet_text), 5):
        five_split = octet_text[i:i+5]
        long_bin = ''.join(five_split)
        for j in xrange(0, len(long_bin), 5):
            encoded += ALPHA[int(long_bin[j:j+5], 2)]
    return encoded

def decode(text):
    decoded = ''
    bin_indices = []
    for c in text:
        index = ALPHA.index(c)
        bin_index = pad_five(bin(index))
        bin_indices.append(bin_index)
    for i in xrange(0, len(bin_indices), 8):
        forty = ''.join(bin_indices[i:i+8])
        for j in xrange(0, len(forty), 8):
            decoded += chr(int(forty[j:j+8], 2))
    take_off = int(decoded[-1])
    decoded = decoded[:-take_off]
    return decoded

for i in xrange(num):
    line = raw_input()
    if i % 2 == 0:
        print encode(line),
    else:
        print decode(line),
