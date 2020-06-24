//Author Mattia
import 'dart:io';

void main() {
  int sums = int.parse(stdin.readLineSync());
  var buffer = StringBuffer();
  for (var i = 0; i < sums; i++) {
    var input = stdin.readLineSync();

    var points = <int, int>{1: 0, 2: 0};

    input.split(' ').forEach((v) {
      var split = v.split('');
      var one = split[0];
      var two = split[1];

      if (one == two) {
        return;
      }

      if (one == 'R' && two == 'S') {
        points[1]++;
      } else if (one == 'S' && two == 'P') {
        points[1]++;
      } else if (one == 'P' && two == 'R') {
        points[1]++;
      }

      if (two == 'R' && one == 'S') {
        points[2]++;
      } else if (two == 'S' && one == 'P') {
        points[2]++;
      } else if (two == 'P' && one == 'R') {
        points[2]++;
      }
    });

    buffer.write('${points[1] > points[2] ? 1 : 2} ');
  }
  print(buffer.toString().trim());
}
