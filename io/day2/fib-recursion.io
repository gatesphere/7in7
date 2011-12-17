#!/usr/local/bin/io

n := System args at(1) asNumber

fib := method(x,
  if(x == 1 or x == 2, return 1)
  if(x == 0, return 0)
  return fib(x-2) + fib(x-1)
)

fib(n) println
