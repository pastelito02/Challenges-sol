//Author Andrey_Murashov
var w = 0;
var h = 0;
var x = 0;
var y = 0;
var x2 = 0;
var y2 = 0;
var xy = 0;
var naprud = '';
var napr = '';
var resxy = '';
var long = 0;
var count = 0;
var str = input();
str.split(' ').forEach(function(num){
  if (count == 0) {
    w = parseInt(num - 1);
  }
  else if (count == 1) {
    h = parseInt(num - 1);
  }
  else if (count == 2) {
    long = parseInt(num - 1);
  }
  count++;
});
count = 0;
resxy = x + ' ' + y + ' ';
napr = 'right';
naprud = 'down';
while (count < 101) {
  while (napr == 'right') {
    while (naprud == 'down') {
      if (y == h) {
        naprud = 'top';
          count++;
        break;
      }
      else {
        if (x2 == w) {
          napr = 'left';
          count++;
          break;
        }
        else {
          x++;
          y++;
          x2 = x + long;
          y2 = y + long;
          resxy += x + ' ' + y + ' ';
          count++;
        }
      }
    }
    while (naprud == 'top') {
      if (y == 0) {
        naprud = 'down';
          count++;
        break;
      }
      else {
        if (x2 == w) {
          napr = 'left';
          count++;
          break;
        }
        else {
          x++;
          y--;
          x2 = x + long;
          y2 = y + long;
          resxy += x + ' ' + y + ' ';
          count++;
        }
      }
    }
  }
  while (napr == 'left') {
    while (naprud == 'down') {
      if (y == h) {
        naprud = 'top';
          count++;
        break;
      }
      else {
        if (x == 0) {
          napr = 'right';
          count++;
          break;
        }
        else {
          x--;
          y++;
          x2 = x + long;
          y2 = y + long;
          resxy += x + ' ' + y + ' ';
          count++;
        }
      }
    }
    while (naprud == 'top') {
      if (y == 0) {
        naprud = 'down';
          count++;
        break;
      }
      else {
        if (x == 0) {
          napr = 'right';
          count++;
          break;
        }
        else {
          x--;
          y--;
          x2 = x + long;
          y2 = y + long;
          resxy += x + ' ' + y + ' ';
          count++;
        }
      }
    }
  }
}
resxy = resxy.replace(' 15 3 14 2 13 1 12 0 11 1 10 2 9 3 8 4 7 5 6 6 5 7 4 8 3 9 2 10 1 11 0 12 ','');
output(resxy);
