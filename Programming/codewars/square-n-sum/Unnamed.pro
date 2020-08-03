square_sum(Numbers, Result) :-
  maplist([N, S] >> (S is N * N), Numbers, Squares),
  sum_list(Squares, Result).
