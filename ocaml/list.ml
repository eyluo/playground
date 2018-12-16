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