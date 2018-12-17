exception NotYetImplemented
exception Range

(* 1 *)
let rec last l = match l with
    [] -> None
  | [x] -> Some x
  | x::xs -> last xs

(* 2 *)
let rec lastTwo l = match l with
    [] | [_] -> None
  | [x; y] -> Some (x, y)
  | x::xs -> lastTwo xs

(* 3 *)
let rec at n l = match (n, l) with
    (_, []) -> None
  | (1, x::xs) -> Some x
  | (_, x::xs) -> at (n - 1) xs

(* 4 *)
let length l =
  let rec length' l n = match l with
      [] -> n
    | x::xs -> length' xs (n + 1)
  in length' l 0

(* 5 *)
let rev l = let
  rec rev' l acc = match l with
      [] -> acc
    | x::xs -> rev' xs (x::acc)
  in rev' l []

(* 6 *)
let isPalindrome l = l = rev l

(* 7 *)
type 'a node = One of 'a | Many of 'a node list

let flatten l =
  let rec flatten' l acc = match l with
      [] -> acc
    | (One x)::xs -> (flatten' xs (x::acc))
    | (Many l)::xs -> (flatten' xs (flatten' l acc))
  in rev (flatten' l [])

(* 8 *)
let compress l = 
  let rec compress' l v acc = match (l, v) with
      ([], _) -> acc
    | (x::xs, None) -> compress' xs (Some x) (x::acc)
    | (x::xs, Some y) -> 
        if x = y then compress' xs v acc
        else compress' xs (Some x) (x::acc)
  in rev (compress' l (None) [])

(* 9 *)
let pack l = 
  let rec pack' l v temp acc = match (l, v) with
      ([], _) -> temp::acc
    | (x::xs, None) -> pack' xs (Some x) (x::temp) acc
    | (x::xs, Some y) -> 
        if x = y then pack' xs v (x::temp) acc
        else pack' xs (Some x) [x] (temp::acc)
  in rev (pack' l None [] [])

(* 10 *)
let encode l = 
  let rec encode' l v acc n = match (l, v) with
      ([], None) -> acc
    | ([], Some y) -> (n, y)::acc
    | (x::xs, None) -> encode' xs (Some x) acc (n + 1)
    | (x::xs, Some y) ->
        if x = y then encode' xs v acc (n + 1)
        else encode' xs (Some x) ((n, y)::acc) 1
  in rev (encode' l None [] 0)

(* 11 *)
type 'a rle = One of 'a | Many of int * 'a

let encode11 l = 
  let rec map f l = match l with
      [] -> []
    | x::xs -> (f x)::(map f xs)
  in map (function (1, a) -> One a | (n, a) -> Many (n, a)) (rev (encode l))

(* 12 *)
let decode l =
  let rec decode' l acc = match l with
      [] -> acc
    | x::xs -> match x with
        One a -> decode' xs (a::acc)
      | Many (n, a) -> if n > 2 then decode' (Many (n - 1, a)::xs) (a::acc)
                       else decode' ((One a)::xs) (a::acc)
  in rev (decode' l [])

(* 13 *)
let encode13 l =
  let rec encode' l v acc n = match (l, v) with
      ([], None) -> acc
    | ([], Some y) -> if n = 1 then (One y)::acc else (Many (n, y))::acc
    | (x::xs, None) -> encode' xs (Some x) acc (n + 1)
    | (x::xs, Some y) ->
        if x = y then encode' xs v acc (n + 1)
        else if n = 1 then encode' xs (Some x) ((One y)::acc) 1
        else encode' xs (Some x) ((Many (n, y))::acc) 1
  in rev (encode' l None [] 0)

(* 14 *)
let rec duplicate l =  match l with
      [] -> []
    | x::xs -> x::(x::(duplicate xs))

(* 15 *)
let replicate l n =
  let rec replicate' l k acc = match (l, k) with
      ([], _) -> acc
    | (x::xs, 0) -> replicate' xs n acc
    | (x::xs, _) -> replicate' l (k - 1) (x::acc)
  in rev (replicate' l n [])

(* 16 *)
let drop l n =
  let rec drop' l i = match l with
      [] -> []
    | x::xs -> if i mod n = 0 then drop' xs (i + 1)
               else x::(drop' xs (i + 1))
  in drop' l 1

(* 17 *)
let split l n = 
  let rec split' (l1, l2, i) = match (l2, i) with
      ([], _) -> (rev l1, l2)
    | (x::xs, 0) -> (rev l1, l2)
    | (x::xs, i) -> split' (x::l1, xs, i - 1)
  in split' ([], l, n)

(* 18 *)
let slice l i j = 
  if i > j || i >= length l then raise Range
  else let
    rec slice' l i j acc = match l with
        [] -> acc
      | x::xs -> match (i, j) with
          (0, 0) -> acc
        | (0, _) -> slice' (xs) i (j - 1) (x::acc)
        | _ -> slice' (xs) (i - 1) (j - 1) acc
  in rev (slice' l i j [])

(* 19 *)
let rotate l n = 
  let len = length l in
  let n' = if n > len then n mod len 
           else if n < 0 then (n mod len) + len 
           else n in
  let l1 = slice l 0 n' in
  let l2 = slice l n' len
  in l2 @ l1

(* 20 *)
let rec removeAt i l = match l with
    [] -> raise Range
  | x::xs -> match i with
      0 -> xs
    | _ -> x::(removeAt (i - 1) xs)

(* 21 *)
let rec insertAt v i l = match l with
    [] -> if i = 0 then [v] else raise Range
  | x::xs -> match i with 
      0 -> v::l
    | _ -> x::(insertAt v (i - 1) xs)

(* 22 *)
let range lo hi = 
  let rec range' lo hi = if lo = hi then [] else lo::(range' (lo + 1) hi)
  in if hi < lo then rev (range' hi lo) else range' lo hi

(* 23 *)
let randSelect l n = 
  let len = length l in
  let rec randSelect' l n = match n with
      0 -> []
    | _ -> (List.nth l (Random.int len))::(randSelect' l (n - 1))
  in randSelect' l n

(* 25 *)
let lottoSelect m n = randSelect (range 1 (n + 1)) m

(* 26 *)
let rec permutation l =
  let rec extract l n acc = match (l, n) with
      ([], _) -> raise Range
    | (x::xs, 0) -> (x, acc @ xs)
    | (x::xs, _) -> extract xs (n - 1) (x::acc) in
  let extract_rand l len = extract l (Random.int len) [] in
  let rec permutation' l len acc = match len with
      0 -> acc
    | _ -> let (picked, rest) = extract_rand l len 
           in permutation' rest (len - 1) (picked::acc)
  in permutation' l (length l) []