(* ****** ****** *)
use "./../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
(*
HX-2023-03-01: midterm1-03: 10 points
*)
(* ****** ****** *)

(*
//
Given a list of distnct integers xs,
list_nchoose2(xs) returns a list of all
the pairs (x1, x2) such that x1 and x2 are
two elements from xs satisfying x1 <= x2.
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
//
For instance,
list_nchoose2([1,3,2]) =
[ (1,3), (1,2), (2,3) ]
list_nchoose2([3,2,1]) =
[ (2,3), (1,3), (1,2) ]
list_nchoose2([3,2,1,4]) =
[(2,3),(1,3),(1,2),(1,4),(2,4),(3,4)]
Note that the returned list is treated as a
set, and the order of the elements in the list
is insignificant.
*)

(* ****** ****** *)

(*
fun
list_nchoose2(xs: int list): (int * int) list = ...
*)

(* ****** ****** *)
fun list_nchoose2(xs: int list): (int * int) list =
  let
    fun loop(xs': int list, res: (int * int) list): (int * int) list =
      case xs' of
        [] => res
      | x1 :: xs'' => 
        let
          fun inner_loop(xs'': int list, acc: (int * int) list): (int * int) list =
            case xs'' of
              [] => acc
            | x2 :: xs''' =>
              if x1 < x2
              then inner_loop(xs''', (x1, x2) :: acc)
              else inner_loop(xs''', (x2, x1) :: acc)
        in
          loop(xs'', inner_loop(xs'', res))
        end
  in
    loop(xs, [])
  end
(* end of [CS320-2023-Spring-midterm1-list_nchoose2.sml] *)
