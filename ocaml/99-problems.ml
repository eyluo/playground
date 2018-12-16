type 'a node =
    | One of 'a 
    | Many of 'a node list

let rec last l = match l with
    [] -> None
  | [x] -> Some x
  | x::xs -> last xs

let rec last_two l = match l with
    [] | [_] -> None
  | [x; y] -> Some (x, y)
  | x::xs -> last_two xs

let rec at n l = match (n, l) with
    (_, []) -> None
  | (1, x::xs) -> Some x
  | (_, x::xs) -> at (n - 1) xs

let length l =
  let rec length' l n = match l with
      [] -> n
    | x::xs -> length' xs (n + 1)
  in length' l 0

let rev l = let
  rec rev' l acc = match l with
      [] -> acc
    | x::xs -> rev' xs (x::acc)
  in rev' l []

let is_palindrome l = l = rev l

let flatten l =
  let rec flatten' l acc = match l with
      [] -> acc
    | (One x)::xs -> (flatten' xs (x::acc))
    | (Many l)::xs -> (flatten' xs (flatten' l acc))
  in rev (flatten' l [])

let compress l = 
  let rec compress' l v acc = match (l, v) with
      ([], _) -> acc
    | (x::xs, None) -> compress' xs (Some x) (x::acc)
    | (x::xs, Some y) -> 
        if x = y then compress' xs v acc
        else compress' xs (Some x) (x::acc)
  in rev (compress' l (None) [])