/*----------------------------------------------------------------------------
   Copyright 2024, Koka-Community Authors

   Licensed under the MIT License ("The License"). You may not
   use this file except in compliance with the License. A copy of the License
   can be found in the LICENSE file at the root of this distribution.
----------------------------------------------------------------------------*/
module type-level/structs
pub import type-level/nil

pub struct field<n,f> 
  v : f

pub fun field/show(f: field<n,f>, ?show: f -> string) : string
  f.v.show

type type-struct<n,f,r>
  TStruct(
    field : field<n,f>,
    rest : r
  )

pub fun any/field(v: a): (some<n> field<n,a>)
  Field(v)
pub fun field/(+)(f1: field<n,f>, f2: field<n1,f1>) : type-struct<n,f,type-struct<n1,f1,type-nil>>
  TStruct(f1, TStruct(f2, TNil))
pub fun prepend/(+)(f1: field<n,f>, s: type-struct<n1,f1,r>) : type-struct<n,f,type-struct<n1,f1,r>>
  TStruct(f1, s)

pub fun direct/get-field(self: type-struct<n,f,r>) : field<n,f>
  self.field
pub fun recur/get-field(self: type-struct<n,f,r>, ?get-field: r -> field<n1,f1>) : field<n1,f1>
  self.rest.get-field

pub fun direct/update-field(self: type-struct<n,f,r>, new-field: field<n,f1>) : type-struct<n,f1,r>
  TStruct(new-field, self.rest)
pub fun recur/update-field(self: type-struct<n,f,r>, new-field: field<n1,f1>, ?update-field: (r, field<n1,f1>) -> r1) : type-struct<n,f,r1>
  TStruct(self.field, self.rest.update-field(new-field))

pub alias fld<n> = some<f> field<n,f>