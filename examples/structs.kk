/*----------------------------------------------------------------------------
   Copyright 2024, Koka-Community Authors

   Licensed under the MIT License ("The License"). You may not
   use this file except in compliance with the License. A copy of the License
   can be found in the LICENSE file at the root of this distribution.
----------------------------------------------------------------------------*/
import type-level/structs

// Empty marker types (names for fields)
type fielda
type fieldb
// Show instances for the field names
fun fa/show(): name<fielda>
  Name("fielda")
fun fb/show(): name<fieldb>
  Name("fieldb")

fun example()
  val record = (1.mk-field : field<fielda, int>) *: ("Hello".mk-field : field<fieldb, string>)
  val f : field<fieldb, string> = record.field
  f.show.println
  val updated-record = record.update-field("World".mk-field : field<fieldb, string>)
  val new : field<fieldb, string> = updated-record.field
  new.show.println