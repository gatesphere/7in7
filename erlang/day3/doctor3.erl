%% I give up
-module(doctor3).
-export([loop/0]).

loop() ->
  process_flag(trap_exit, true),
  receive
    {link, Boss} ->
      register(boss, Boss),
      link(boss),
      loop();
    new ->
      io:format("Creating and monitoring process.~n"),
      register(revolver, spawn_link(fun roulette:loop/0)),
      loop();
    {'EXIT', revolver, Reason} ->
      io:format("The shooter ~p died with reason ~p.~n", [revolver, Reason]),
      io:format("Restarting.~n"),
      self() ! new,
      loop();
    {'EXIT', boss, Reason} ->
      io:format("The boss ~p died with reason ~p.~n", [boss, Reason]),
      io:format("Restarting.~n"),
      register(boss, spawn_link(fun boss:loop/0)),
      boss ! {link, self()}
end.
