// string foldLeft

val list = List("this", "is", "a", "list")

println(list.foldLeft(0)((sum, word) => sum + word.size))
