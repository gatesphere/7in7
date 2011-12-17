#!/usr/local/bin/io

n := System args at(1) asNumber

fib := method(x,
  if(x == 1 or x == 2, return 1)
  if(x == 0, return 0)
  a := 1
  b := 1
  c := 0
  (x - 2) repeat(
    c = a + b;
    a = b;    
    b = c
  )
  c
)

fib(n) println
