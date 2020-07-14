#!/bin/bash
movie() {
  card=$1
  ticket=$2
  perc=$3
  awk "
    function ceil(x) {
      return int(x) == x ? x : int(x) + 1;
    }
    BEGIN {
      n = 1
      while (ceil($card + ($ticket * $perc * ($perc ^ n - 1)) / ($perc - 1)) >= $ticket * n) {
        n += 1
      }
      print n
    }"
}
movie $1 $2 $3
