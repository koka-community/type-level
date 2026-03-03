/*----------------------------------------------------------------------------
   Copyright 2024, Koka-Community Authors

   Licensed under the MIT License ("The License"). You may not
   use this file except in compliance with the License. A copy of the License
   can be found in the LICENSE file at the root of this distribution.
----------------------------------------------------------------------------*/
module type-level/nil

// An empty type-level list
pub type type-nil
  TNil

// List operations for type-nil
pub fun append(_: type-nil, r : b) : b
  r
pub fun (++)(_: type-nil, r : b) : b
  r
pub fun map(l: type-nil) : type-nil
  l
pub fun to-list(_: type-nil): list<a>
  Nil

// Show instances for type-nil
pub fun strlist/show(_: type-nil): list<string>
  Nil
pub fun empty/show(_: type-nil): string
  "[]"
