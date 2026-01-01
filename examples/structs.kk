/*----------------------------------------------------------------------------
   Copyright 2024, Koka-Community Authors

   Licensed under the MIT License ("The License"). You may not
   use this file except in compliance with the License. A copy of the License
   can be found in the LICENSE file at the root of this distribution.
----------------------------------------------------------------------------*/
import type-level/structs

type fielda
type fieldb

fun example()  
  val record = ("1".mk-field : fld<fielda>) + ("Hello".mk-field : fld<fieldb>)
  val f : fld<fieldb> = record.field
  f.println 
  val updated-record = record.update-field("World".mk-field : fld<fieldb>)
  val new : fld<fieldb> = updated-record.field
  new.println