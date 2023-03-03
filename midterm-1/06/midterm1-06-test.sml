(* ****** ****** *)
use
"./list_grouping.sml";
(* ****** ****** *)

local

exception ERROR_midterm1_06

(* ****** ****** *)

in (*local*)

(* ****** ****** *)

val N = 1000
val nxs =
list_grouping(int1_map_list(N, fn i => N-i))
val () =
print("midterm1-06-test: N=1000: passed!\n")
val N = 1000000
val nxs =
list_grouping(int1_map_list(N, fn i => N-i))
val () =
print("midterm1-06-test: N=1000000: passed!\n")

(* ****** ****** *)

val () =
print("midterm1-06-test: no failure detected!\n")

(* ****** ****** *)

end(*end-of-local*)

(* ****** ****** *)
fun list_grouping(xs: int list): (int * int) list =
    let 
        fun help1(x, xs)= list_reduce_left(xs, 0, fn (n, y) => if x = y then n+1 else n)
        fun help2(x, xs)= list_reduce_left(xs, false, fn (found, y) => if x = y then true else found)
    in
        let
            val distinct = list_reduce_left(xs, nil, fn (ys, x) => if help2(x, ys) then ys else x :: ys)
            val count = list_map(distinct, fn x => (help1(x, xs), x))
        in
        count
        end
    end
(* end of [CS320-2023-Spring-quizzes-midterm1-06-test.sml] *)

