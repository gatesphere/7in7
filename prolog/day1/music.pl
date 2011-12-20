plays('Anders Friden', vocals).
plays('Bjorn Gelotte', guitar).
plays('Niclas Engelin', guitar).
plays('Peter Iwers', bass).
plays('Daniel Svensson', drums).
plays('Mikael Akerfeldt', vocals).
plays('Mikael Akerfeldt', guitar).
plays('Martin Mendez', bass).
plays('Martin Axenrot', drums).
plays('Fredrik Akesson', guitars).
plays('Joakim Svalberg', keys).

style('In Flames', 'Melodic Death Metal').
style('Opeth', 'Progressive Death Metal').

member('Anders Friden', 'In Flames').
member('Bjorn Gelotte', 'In Flames').
member('Niclas Engelin', 'In Flames').
member('Peter Iwers', 'In Flames').
member('Daniel Svensson', 'In Flames').
member('Mikael Akerfeldt', 'Opeth').
member('Martin Mendez', 'Opeth').
member('Martin Axenrot', 'Opeth').
member('Fredrik Akesson', 'Opeth').
member('Joakim Svalberg', 'Opeth').

guitar :-
  plays(X, guitar),
  write(X), nl,
  fail.
guitar.

:-guitar.
