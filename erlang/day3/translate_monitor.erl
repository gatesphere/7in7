-module(translate_monitor).
-export([loop/0]).

loop() ->
  process_flag(trap_exit, true),
  receive
    new ->
      io:format("Creating a new translator.~n"),
      register(translator, spawn_link(fun translate_service:loop/0)),
      loop();
    {'EXIT', From, Reason} ->
      io:format("~p died: ~p.~n", [From, Reason]),
      io:format("restarting.~n"),
      self() ! new,
      loop()
end.
