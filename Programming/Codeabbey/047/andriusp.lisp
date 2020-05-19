;Author andriusp
DEBUG = False

input_data_file = 'input.txt'

def log(*s):
    if DEBUG:
        for i in s:
            print(i)

input_data = open(input_data_file, "r").readlines()
log('RAW data:\n', input_data)

input_data = [n.strip('\n') for n in input_data] #remove \n from the data
log(input_data)

total = (input_data[0].split())
log(total)
k = 26 - int(total[1]) # subtrack from number of letters for decryption
log(k)

del input_data[0] # remove numbers from input data
print(' '.join(input_data))

dict_original1 = "A B C D E F G H I J K L M N O P Q R S T U V W X Y Z"
dict_original = dict_original1.replace(" ", "")
log(dict_original)
dict_modified = dict_original[k:] + dict_original[0:k] #modify dictionary by k
log(dict_modified)

result = ''

for each_sentence in input_data:
    
    log(each_sentence)

    for letter in each_sentence:

        if letter == " " or letter == ".": # do not replace space and dot
            result = result + letter
        else: # build decrypted message here
            result = result + dict_modified[dict_original.index(letter)]

    result = result + " " #sentence separator


print(result)
