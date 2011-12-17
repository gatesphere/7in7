#!/usr/local/bin/io

2dsum := method(list,
  list flatten sum
)

l := list(list(1,2,3),list(4,5),list(6,7,8))

writeln("l :", l)
writeln("2dsum(l): ", 2dsum(l))

