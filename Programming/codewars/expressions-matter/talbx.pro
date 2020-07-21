expression_matter(A, B, C, R) :-
  X1 is A*(B+C),
  X2 is A*B*C,
  X3 is A+B+C,
  X4 is (A+B)*C,
  X5 is A+(B*C),
  X6 is (A*B)+C,
  Y = [X1,X2,X3,X4,X5,X6],
  max_list(Y,R).
