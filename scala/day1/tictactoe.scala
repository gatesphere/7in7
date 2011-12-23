/*
  board is a 9 character string:
  
  012
  345
  678
  
  valid characters:
  X, O, _
*/

class Board(val contents: String) {
  def detectWin() {
    if(row1) {
      println(contents.charAt(0).toString + " wins")
    } else if(row2) {
      println(contents.charAt(3).toString + " wins")
    } else if(row3) {
      println(contents.charAt(6).toString + " wins")
    } else if(col1) {
      println(contents.charAt(0).toString + " wins")
    } else if(col2) {
      println(contents.charAt(1).toString + " wins")
    } else if(col3) {
      println(contents.charAt(2).toString + " wins")
    } else if(diag1) {
      println(contents.charAt(0).toString + " wins")
    } else if(diag2) {
      println(contents.charAt(2).toString + " wins")
    } else {
      println("No win yet.")
    }
  }
  
  def row1(): Boolean = {
    var retval = false
    if(contents.charAt(0) == contents.charAt(1) && contents.charAt(1) == contents.charAt(2)) {
      if(contents.charAt(0) != '_') {
        retval = true
      }
    }
    retval
  }
  
  def row2(): Boolean = {
    var retval = false
    if(contents.charAt(3) == contents.charAt(4) && contents.charAt(4) == contents.charAt(5)) {
      if(contents.charAt(3) != '_') {
        retval = true
      }
    }
    retval
  }
       
  def row3(): Boolean = {
    var retval = false
    if(contents.charAt(6) == contents.charAt(7) && contents.charAt(7) == contents.charAt(8)) {
      if(contents.charAt(6) != '_') {
        retval = true
      }
    }
    retval
  }

  def col1(): Boolean = {
    var retval = false
    if(contents.charAt(0) == contents.charAt(3) && contents.charAt(3) == contents.charAt(6)) {
      if(contents.charAt(0) != '_') {
        retval = true
      }
    }
    retval
  }

  def col2(): Boolean = {
    var retval = false
    if(contents.charAt(1) == contents.charAt(4) && contents.charAt(4) == contents.charAt(7)) {
      if(contents.charAt(1) != '_') {
        retval = true
      }
    }
    retval
  }

  def col3(): Boolean = {
    var retval = false
    if(contents.charAt(2) == contents.charAt(5) && contents.charAt(5) == contents.charAt(8)) {
      if(contents.charAt(2) != '_') {
        retval = true
      }
    }
    retval
  }
  
  def diag1(): Boolean = {
    var retval = false
    if(contents.charAt(0) == contents.charAt(4) && contents.charAt(4) == contents.charAt(8)) {
      if(contents.charAt(0) != '_') {
        retval = true
      }
    }
    retval
  }

  def diag2(): Boolean = {
    var retval = false
    if(contents.charAt(2) == contents.charAt(4) && contents.charAt(4) == contents.charAt(6)) {
      if(contents.charAt(2) != '_') {
        retval = true
      }
    }
    retval
  }

  def display() {
    for(i <- 0 until contents.size) {
      print(contents.charAt(i) + " ")
      if (i % 3 == 2) println
    }
  }
}

val b = new Board("XXX_O_O_X")
b.display
b.detectWin

val b2 = new Board("O___O___O")
b2.display
b2.detectWin

val b3 = new Board("_________")
b3.display
b3.detectWin
