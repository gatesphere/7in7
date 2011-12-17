#!/usr/local/bin/io

number := Random value(1,100) round

for(i,1,10,
  "guess? " print
  guess := File standardInput readLine
  if (guess asNumber == number, break,
    if(guess asNumber > number, "lower" println, "higher" println)
  )
)

