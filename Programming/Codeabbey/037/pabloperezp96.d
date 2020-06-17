//Author pabloperezp96
import std.stdio;
import std.file;
import std.array;
import std.conv;
import std.math;

void main(){
  File file = File("DATA.lst", "r");
  string input = file.readln();
  string [] parameters = input.split(" ");
  const int P = parse!int(parameters[0]);
  const double R = parse!double(parameters[1])/100;
  const int L = parse!int(parameters[2]);
  double M = 0;

  M = P * (((R/12)*(pow((R/12+1),L))/(pow((R/12+1),L)-1)));

  write(round(M));
}