#Author igor_sekretarev
Base32 = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ234567'

def encode(text):
    k = 5 - len(text) % 5
    text += str(k) * k
    bits = ''
    for ch in text:
        byte = bin(ord(ch))[2:]
        bits += ('0' * (8 - len(byte)) + byte)
    message = ''
    for i in range(len(bits) // 5):
        message += Base32[int(bits[5 * i:5 * (i + 1)], 2)]
    return message

def decode(text):
    bits = ''
    for ch in text:
        byte = bin(Base32.find(ch))[2:]
        bits += ('0' * (5 - len(byte)) + byte)
    message = ''
    for i in range(len(bits) // 8):
        message += chr(int(bits[8 * i:8 * (i + 1)], 2))
    for k in range(1, 6):
        if message[-k:] == str(k) * k:
            return message[:-k]
    return message

for i in range(int(input())):
    if i % 2:
        print(decode(input()), end = ' ')
    else:
        print(encode(input()), end = ' ')
