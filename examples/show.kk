import type-level/list

fun main()
  val l = 'a' +: 1 +: TNil
  val strings : list<string> = l.show
  strings.println
