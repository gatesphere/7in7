#!/usr/local/bin/io

Number old_div := Number getSlot("/")

Number / := method(denom,
  if(denom == 0, return 0)
  self old_div(denom)
)

writeln("2/3: ", 2 / 3)
writeln("2 old_div(3): ", 2 old_div(3))
writeln("3/0: ", 3 / 0)
writeln("3 old_div(0): ", 3 old_div(0))
