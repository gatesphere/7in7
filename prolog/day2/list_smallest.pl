%% list smallest

smallest(List, Smallest) :- smallest(List, [], Smallest).

smallest([Head|Tail], [], Smallest) :-
  smallest(Tail, Head, Smallest).
smallest([Head|Tail], Gather, Smallest) :-
  Head < Gather,
  smallest(Tail, Head, Smallest).
smallest([Head|Tail], Gather, Smallest) :-
  Head > Gather,
  smallest(Tail, Gather, Smallest).
smallest([], Smallest, Smallest).
