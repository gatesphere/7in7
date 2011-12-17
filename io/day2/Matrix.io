Matrix := Object clone do(
  contents ::= nil

  init := method(
    contents = nil
  )

  dim := method(x,y,
    self contents = list()
    for(i,1,y,
      self contents append(list() setSize(x))
    )
  )

  set := method(x,y,value,
    self contents at(y) atPut(x,value)
    self
  )

  get := method(x,y,
    self contents at(y) at(x)
  )
  
  transpose := method(
    newm := Matrix clone
    newmy := self contents size
    newmx := self contents at(0) size
    newm dim(newmy,newmx)
    self contents foreach(y,i,
      i foreach(x,element,
        newm set(y,x,element)
      )
    )
    newm
  )
)