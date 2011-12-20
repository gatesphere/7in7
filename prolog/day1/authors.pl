author('VALIS', 'Philip K. Dick').
author('Witch and Wizard', 'James Patterson').
author('Angels and Demons', 'Dan Brown').
author('Ubik', 'Philip K. Dick').

allbypkd :-
  author(X, 'Philip K. Dick'),
  write(X), nl,
  fail.
allbypkd.

:-allbypkd.
