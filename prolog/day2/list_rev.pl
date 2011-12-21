%% list reverse

reverse(List, Reverse) :- reverse(List, [], Reverse).

reverse([Head|Tail], Gather, Reverse) :-
  reverse(Tail, [Head|Gather], Reverse).
reverse([], Reverse, Reverse).
