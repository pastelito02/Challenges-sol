#Author mykola_kozlenko
test_cases = int(input())
notes_for_analisys = input().split()

base_frequencies = [440 * 2**(i/12) for i in range(-9, 3)]

notes = {'C': 0, 'C#': 1, 'D': 2, 'D#': 3, 'E': 4, 'F': 5, 'F#': 6, 'G': 7, 'G#': 8, 'A': 9, 'A#': 10, 'B': 11}

def main():

    for i in notes_for_analisys:
        octave = int(i[-1:])
        note = i[0: -1]

        frequency = base_frequencies[notes[note]] * 2**(octave - 4)

        print(round(frequency), end=' ')

main()
