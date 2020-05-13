<!--Author vsmihaylovsky-->
<?php
  fscanf(STDIN, "%d\n", $testСasesCount);
  $testСases = explode(' ', fgets(STDIN));
  $sqrt5 = sqrt(5);

  $result = '';
  foreach ($testСases as $testСase) {
    $fib_num1 = 0;
    $fib_num2 = 1;
    $fib_pos = 1;
    while (true) {
      $fib_pos++;
      $fib_num3 = $fib_num1 + $fib_num2;
      if ($fib_num3 % $testСase == 0) {
        break;
      }
      $fib_num1 = $fib_num2;
      $fib_num2 = $fib_num3 % $testСase;
    }

    $result[] = $fib_pos;
  }

  echo implode(' ', $result);
