-module(day2).
-export([lookup/2]).
-export([shopping/1]).
-export([tictactoe/1]).

lookup([], _) -> io:fwrite("No match.\n");
lookup([{K, V}|T], Key) ->
  case K of
    Key -> V;
    _ -> lookup(T, Key)
  end;
lookup(_,_) -> io:fwrite("No match.\n").

shopping(List) -> [{Item, Quantity * Price} || {Item, Quantity, Price} <- List].
