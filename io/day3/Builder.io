#!/usr/local/bin/io

Builder := Object clone

Builder levelcount := 0;

OperatorTable addAssignOperator(":","atPutNumber")
curlyBrackets := method(
  r := Map clone
  call message arguments foreach(arg,
    r doMessage(arg)
  )
  r
)
Map atPutNumber := method(
  self atPut(
    call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
    call evalArgAt(1)
  )
)

Builder forward := method(
  self levelcount = self levelcount + 1
  s := "";
  for (i, 1, self levelcount - 1,
    s = s .. "  "
  );
  write(s, "<", call message name)
  call message arguments foreach(i, arg,
    if(i == 0,
      content := self doMessage(arg);
      if(content type == "Map",
        writeln(" ", content keys at(0), "=", content values at(0) asMutable prependSeq("\"") appendSeq("\""), ">"), 
        writeln(">");
        if(content type == "Sequence",
          writeln(s .. "  ", content)
        )
      )
      continue;
    )
    content := self doMessage(arg);
    if(content type == "Sequence", 
      writeln(s .. "  ", content)
    )
  )
  writeln(s, "</", call message name, ">")
  self levelcount = self levelcount - 1
)

Builder ul(
  {"order" : "none"},
  li("Io"),
  li("Lua"),
  li("JavaScript")
)
