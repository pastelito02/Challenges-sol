% Store the result inside 3rd argument. Good luck!
array_plus_array(Arr1, Arr2, Result) :-
  sum_array(Arr1, S1),
  sum_array(Arr2, S2),
  Result is S1 + S2.

sum_array([], 0).

sum_array([H | T], R):-
  sum_array(T, R1),
  R is R1 + H.
