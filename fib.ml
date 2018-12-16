type tree = Empty | Node of (tree * int * tree)

let rec fib n = match n with
  0 -> 1
| 1 -> 1
| _ -> fib (n - 1) + fib (n - 2)

let rec preOrder t = match t with
  Empty -> []
| Node(l, x, r) -> x::(preOrder l @ preOrder r)

let rec inOrder t = match t with
  Empty -> []
| Node(l, x, r) -> inOrder l @ x::(inOrder r)

let rec postOrder t = match t with
  Empty -> []
| Node(l, x, r) -> (postOrder l @ postOrder r) @ [x]

let rev l = let
  rec rev' l acc = match l with
    [] -> acc
  | x::xs -> rev' xs (x::acc)
  in rev' l []

let rec map f l = match l with
  [] -> []
| x::xs -> (f x)::(map f xs)

let rec filter f l = match l with 
  [] -> []
| x::xs -> if f x then x::(filter f xs) else filter f xs

let rec reduce f b l = match l with
  [] -> b
| x::xs -> reduce f (f(b, x)) xs