#!/usr/local/bin/io

// list syntax using square brackets

squareBrackets := method(
  l := list()
  call message arguments foreach(arg,
    l append(l doMessage(arg))
  )
  l
)

alist := [1,2,3,"apple"]
alist println
