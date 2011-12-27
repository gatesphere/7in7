-module(count).
-export([words_in_string/1]). %% hide the helper function... actually counts spaces. :-/
-export([count_to_ten/0]). %% hide the helper function
-export([react/1]).

words_in_string(String) -> words_in_string(String, 1).

words_in_string([32|Tail], N) -> words_in_string(Tail, N+1);
words_in_string([],N) -> io:fwrite(integer_to_list(N)), io:fwrite("\n");
words_in_string([_|Tail], N) -> words_in_string(Tail, N).

count_to_ten() -> count_to_ten(1).

count_to_ten(10) -> io:fwrite(integer_to_list(10)), io:fwrite("\n");
count_to_ten(N) -> io:fwrite(integer_to_list(N)), io:fwrite("\n"), count_to_ten(N+1).

react(success) -> io:fwrite("success\n");
react({error, Message}) -> io:fwrite("error: "), io:fwrite(Message), io:fwrite("\n").
