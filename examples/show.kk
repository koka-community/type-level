/*----------------------------------------------------------------------------
   Copyright 2024, Koka-Community Authors

   Licensed under the MIT License ("The License"). You may not
   use this file except in compliance with the License. A copy of the License
   can be found in the LICENSE file at the root of this distribution.
----------------------------------------------------------------------------*/
import type-level/list
import type-level/structs

type fielda
type fieldb
fun fa/show(): name<fielda>
  Name("fielda")
fun fb/show(): name<fieldb> 
  Name("fieldb")

fun main()
  val l1 : t-cons<char,t-cons<int,t-nil>> = 'a' +: 1 +: TNil
  l1.println
  val l2 = 'b' +: 2
  l2.println 
  val s = (1.mk-field : field<fielda, int>) *: ("Hello".mk-field : field<fieldb, string>)
  s.println