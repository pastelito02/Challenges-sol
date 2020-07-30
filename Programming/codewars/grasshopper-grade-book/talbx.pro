get_grade(A,B,C,O) :- I is floor((A+B+C) / 3),
    grade(I,O).
grade(I,O) :-
   I < 60 -> O = 'F';
   I < 70 -> O = 'D';
   I < 80 -> O = 'C';
   I < 90 -> O = 'B';
   I =< 100 -> O = 'A'.
