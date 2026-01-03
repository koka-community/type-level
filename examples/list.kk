/*----------------------------------------------------------------------------
   Copyright 2024, Koka-Community Authors

   Licensed under the MIT License ("The License"). You may not
   use this file except in compliance with the License. A copy of the License
   can be found in the LICENSE file at the root of this distribution.
----------------------------------------------------------------------------*/
import type-level/list

fun main()
  val left = 0 +: "Hi!" +: "Hi!" +: TNil
  val right = [1, 2] +: 3 +: "Hi!" +: "Hi!" +: TNil
  fun mapper(x : a, ?show : a -> string) : string
    x.show 
  val appended = left ++ right ++ left
  appended.map().to-list.show
