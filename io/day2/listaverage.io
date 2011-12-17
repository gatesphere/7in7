#!/usr/local/bin/io

List myAverage := method(
  sz := self size
  s := 0
  self foreach(element,
    if(element type != "Number",
      Exception raise("Element " .. element .. " is not a number!");
      return nil
    )
    s = s + element
  )
  s / sz
)

l := list(1,2,3,4,5,6,7,8)
l2 := list(1,2,3,"apple")

writeln("l: ", l)
writeln("l myAverage: " l myAverage)
writeln("l2: ", l2)
writeln("l2 myAverage: " l2 myAverage)

