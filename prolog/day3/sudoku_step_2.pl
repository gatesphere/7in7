
%% definition for fd_define... I'm using SWI-Prolog
fd_domain([], _, _).
fd_domain([Head|Tail], Low, High) :-
  Head =< High,
  Head >= Low,
  fd_domain(Tail, Low, High).

sudoku(Puzzle, Solution) :-
  Solution = Puzzle,
  Puzzle = [S11, S12, S13, S14,
            S21, S22, S23, S24,
            S31, S32, S33, S34, 
            S41, S42, S43, S44],
  fd_domain(Puzzle, 1, 4).

