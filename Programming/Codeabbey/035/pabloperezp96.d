//Author pabloperezp96
import std.stdio;
import std.file;
import std.array;
import std.conv;

void main(){
  File file = File("DATA.lst", "r");
  string testcases = file.readln();
  const int t = parse!int(testcases);
  int [] answers = new int[](t);

  for(int i = 0 ; i < t; i++){
    string input = file.readln();
    string [] parameters = input.split(" ");
    const int S = parse!int(parameters[0]);
    const int R = parse!int(parameters[1]);
    const double P = parse!double(parameters[2])/100;
    double total = S;
    int count = 0;
    while(total < R){
      total = total + (total*P);
      count++;
    }
    answers[i]=count;
  }
  writefln("%(%s %)", answers[]);
}
