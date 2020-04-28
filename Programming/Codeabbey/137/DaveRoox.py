#Author DaveRoox
class ShannonFanoCoding:
    @staticmethod
    def balance(subset):
        splittindex = 0
        diff = abs(subset[0][0] - sum([x[0] for x in subset[1:]]))
        while splittindex + 1 < len(subset) and \
                            abs(sum([x[0] for x in subset[:splittindex + 2]]) - sum(
                                    [y[0] for y in subset[splittindex + 2:]])) < diff:
                splittindex += 1
                diff = abs(
                    sum([x[0] for x in subset[:splittindex + 1]]) - sum([y[0] for y in subset[splittindex + 1:]]))
        return splittindex

    @staticmethod
    def insert(subset, sequence, chars, char_indices):
        if not subset:
            return
        if len(subset) == 1:
            chars[char_indices[subset[0][1]]][2] = sequence
            return
        splittindex = ShannonFanoCoding.balance(subset)
        ShannonFanoCoding.insert(subset[:splittindex + 1], sequence + 'O', chars, char_indices)
        ShannonFanoCoding.insert(subset[splittindex + 1:], sequence + 'I', chars, char_indices)
        return

    @staticmethod
    def f():
        char_indices, chars = {}, []
        string = input()
        for char in string:
            if char in char_indices:
                chars[char_indices[char]] = [chars[char_indices[char]][0] + 1, char, '']
            else:
                char_indices[char] = len(chars)
                chars.append([1, char, ''])
        from operator import itemgetter
        chars.sort(key=itemgetter(1))
        chars.sort(key=itemgetter(0), reverse=True)
        for index, pair in enumerate(chars):
            char_indices[pair[1]] = index
        ShannonFanoCoding.insert(chars[:], '', chars, char_indices)
        for char in chars:
            print(ord(char[1]), char[2], end=' ')

ShannonFanoCoding.f()
