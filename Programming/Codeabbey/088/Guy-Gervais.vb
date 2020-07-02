'Author Guy Gervais
Sub Main ' Version 2

    Dim input = <![CDATA[
E5 C#1 C3 D2 D#1 C2 A2 G#5 B2 C#3 G5 D#4 A#2 F1 E1 D5 C#5 B5 F#1
]]>.Value()
    
    dim notes = "C C# D D# E F F# G G# A A# B".split(" "c).tolist ' Inspired by StephenR's solution. Python rocks.
    dim Hz = 55 * (1 / 2 ^ (9 / 12)) 'Hz of C1
    dim sps = 2^(1/12) ' single pitch step

    dim pitches = new dictionary(of string, integer) ' Not as succinct as Python... might be a better way?
    for each key in (from octv in {1, 2, 3, 4, 5} from note in notes select note & octv) ' LINQ cross-join
        pitches.add(key, math.round(hz))
        hz *= sps
    next

    dim ans = Join(input.trim.split(" "c).tolist.select(function(x) Cstr(pitches(x))).toarray, " "c)
    ans.dump
        
End Sub