[
  awesomeaf
  Multiply
  The program below should receive exactly
  two bytes of input, multiply them together
  and output the resulting byte as an ASCII
  character

  Example:
  Input - byte(3), byte(5)
  Output - byte(15)

  The program isn't working.  Try to figure out why.
  (Don't worry about cell overflow - this will not be tested)
]

0 1  2 3
0 0 15 5

,          (write) cell 0
>          (goto) cell 1
,          (write) cell 1
<          (goto) cell 0

[-         (while) cell 0 gt 0; (decr) 1

  >        (goto) cell 1

           (incr values from) cell 1 to cell 2 and cell 3
  [-       (while) cell 1 gt 0; (decr) 1
    >      (goto) cell 2
    +      (incr) cell 2
    >      (goto) cell 3
    +      (incr) cell 3
  <<]      (end while) cell 1

  >>       (goto) cell 3

           (incr values from) cell 3 to cell 1
  [-       (while) cell 3 gt 0; (decr) 1
    <<     (goto) cell 1
    +      (incr) cell 1
  >>]      (end while) cell 3

<<<]       (end while) cell 0

>>         (goto) cell 2
.          (read) cell 2
