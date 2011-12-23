trait Censor {
  val words = Map("Shoot" -> "Pucky", "Darn" -> "Beans")
  val list = List("")
  def censor = list.map(i => if (words.contains(i)) words(i) else i)
}

object Bad extends Censor {
  override val list = List("List", "of", "bad", "words", "like", "Shoot", "and", "Darn")
}

println(Bad.list)
println(Bad.censor)
