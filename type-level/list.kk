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

pub fun tcons/append(TCons(h, t): type-cons<a, b>, r: c, ?append: (b, c) -> d) : type-cons<a, d>
   TCons(h, t.append(r))
pub fun tcons/(++)(TCons(h, t): type-cons<a, b>, r: c, ?(++): (b, c) -> d) : type-cons<a, d>
   TCons(h, t ++ r)

pub fun tcons/map(TCons(x, t) : type-cons<a, b>, ?mapper : (a -> c), ?map : (b) -> d) : type-cons<c, d>
  TCons(mapper(x), t.map)

pub fun tcons/to-list(TCons(h, t) : type-cons<a, b>, ?to-list : (b) -> list<a>) : list<a>
  Cons(h, t.to-list)

pub fun map/show(t : type-cons<a,b>, ?a/show : a -> string, ?tail/show : b -> list<string>) : list<string>
  match t 
    TCons(h, t') -> Cons(h.show, t'.show)
pub fun list/show(t: type-cons<a, b>, ?a/show : a -> string, ?tail/show : b -> list<string>) : string
  "[" ++ t.map/show.join(",") ++ "]"