//Author mcferden
import std.algorithm;
import std.array;
import std.container;
import std.conv;
import std.functional;
import std.math;
import std.range;
import std.stdio;
import std.string;
import std.typecons;

auto getFrequency(string note)
{
    int[string] NOTES = ["C" : -9, "C#": -8, "D" : -7, "D#": -6, "E" : -5, "F" : -4, "F#": -3, "G" : -2, "G#": -1, "A" :  0, "A#":  1, "B" :  2];

    auto noteName = note[0..$-1];
    auto octave   = note[$-1..$].to!int();

    return roundTo!int(440 * 2 ^^ ((12 * (octave - 4) + NOTES[noteName]) / 12.0));
}

void main()
{
    auto file = stdin;
    file.readln();
    file
        .readln()
        .split()
        .map!(note => getFrequency(note))
        .each!(freq => writef("%s ", freq));
}
