-module(boss).
-export([loop/0]).

loop() ->
  process_flag(trap_exit, true),
  receive
    {link, Doctor} ->
      register(doctor, Doctor),
      link(doctor),
      loop();
    new ->
      io:format("Creating a new doctor and linking...~n"),
      register(doctor, spawn_link(fun doctor3:loop/0)),
      doctor ! {link, self()},
      doctor ! new,
      loop();
    {'EXIT', _, _} ->
      io:format("Doctor died... making a new one.~n"),
      self() ! new,
      loop()
end.
