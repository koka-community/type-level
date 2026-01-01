/*----------------------------------------------------------------------------
   Copyright 2024, Koka-Community Authors

   Licensed under the MIT License ("The License"). You may not
   use this file except in compliance with the License. A copy of the License
   can be found in the LICENSE file at the root of this distribution.
----------------------------------------------------------------------------*/
module type-level/list
pub import type-level/nil

pub infixr 5 (+:)

pub type type-cons<a, b>
  TCons(
    head : a,
    tail : b
  )
pub fun (+:)(a: a, rst: b) : type-cons<a, b>
   TCons(a, rst)

pub fun tnil/append(l: type-nil, r : b) : b
  r
pub fun tcons/append(TCons(h, t): type-cons<a, b>, r: c, ?append: (b, c) -> d) : type-cons<a, d>
   TCons(h, t.append(r))
pub fun tnil/(++)(l: type-nil, r : b) : b
  r
pub fun tcons/(++)(TCons(h, t): type-cons<a, b>, r: c, ?(++): (b, c) -> d) : type-cons<a, d>
   TCons(h, t ++ r)

pub fun tnil/map(l: type-nil) : type-nil
  l
pub fun tcons/map(TCons(x, t) : type-cons<a, b>, ?mapper : (a -> c), ?map : (b) -> d) : type-cons<c, d>
  TCons(mapper(x), t.map)

pub fun tnil/list(l : type-nil) : list<a>
  Nil
pub fun tcons/list(TCons(h, t) : type-cons<a, b>, ?list : (b) -> list<a>) : list<a>
  Cons(h, t.list)