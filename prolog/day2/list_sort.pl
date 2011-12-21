%% list sort

remove(Element, [Element|Result], Result).
remove(Element, [Head|Result], [Head|Safe]) :-
  remove(Element, Result, Safe).

perm([Head|Tail], Permutation) :-
  perm(Tail, Chunk),
  remove(Head, Permutation, Chunk).
perm([],[]).

is_sorted([]).
is_sorted([_]).
is_sorted([Head1, Head2|Tail]) :-
  Head1 =< Head2,
  is_sorted([Head2|Tail]).

list_sort(List, Sorted) :-
  perm(List, Sorted),
  is_sorted(Sorted).
