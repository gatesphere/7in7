%% apparently not really possible without some fiddly hacks.  The following code is horribly broken.

-module(doctor2).
-export([loop/0]).

loop() ->
  process_flag(trap_exit, true),
  receive
    new ->
      io:format("Creating and monitoring process.~n"),
      register(revolver, spawn_link(fun roulette:loop/0)),
      loop();
    {'EXIT', From, Reason} ->
      case Reason of
        revolver ->
          io:format("The shooter ~p died with reason ~p.~n", [From, Reason]),
          io:format("Restarting.~n"),
          self() ! new,
          loop();
        doctor ->
          io:format("The doctor ~p died with reason ~p.~n", [From, Reason]),
          exit(whereis(revolver), revolver),
          register(doctor, spawn(fun doctor2:loop/0)),
          doctor ! new
      end
end.
