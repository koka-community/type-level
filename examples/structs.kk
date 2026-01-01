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
// Apparently there is issues with the language server / recompilation when using `some<f>` from another module 
// so we cannot put this abbreviation in the structs module itself.
alias fld<n> = some<f> field<n,f>

fun example()
  val record = ("1".mk-field : fld<fielda>) + ("Hello".mk-field : fld<fieldb>)
  val f : fld<fieldb> = record.field
  f.println
  val updated-record = record.update-field("World".mk-field : fld<fieldb>)
  val new : fld<fieldb> = updated-record.field
  new.println