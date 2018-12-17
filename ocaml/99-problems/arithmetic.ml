exception NotYetImplemented

(* 31 *)
let isPrime n =
  let rec isPrime' i = 
    if i = n then true
    else if n mod i = 0 then false 
    else isPrime' (i + 1)
  in isPrime' 2

(* 32 *)
let rec gcd m n = match (m, n) with
    (0, _) -> n
  | (_, 0) -> m
  | _ -> if m > n then gcd (m mod n) n
         else gcd m (n mod m)

(* 33 *)
let coprime m n = 
  let i = min m n in
  let rec coprime' j = if j > i then true
    else if m mod j = 0 && n mod j = 0 then false
    else coprime' (j + 1)
  in coprime' 2

(* 34 *)
let phi n = 
  let rec phi' i acc = 
    if i = n then acc
    else if coprime n i then phi' (i + 1) (acc + 1)
    else phi' (i + 1) acc
  in phi' 2 1

(* 35 *)
let factors n =
  let rec factors' n i = 
    if i > n then []
    else if n mod i = 0 && isPrime i then i::(factors' (n / i) i)
    else factors' n (i + 1)
  in factors' n 2 

(* 36 *)
let factors36 n = 
  let encode l = 
    let rec encode' l v n = match (l, v) with
        ([], None) -> []
      | ([], Some y) -> [(y, n)]
      | (x::xs, None) -> encode' xs (Some x) (n + 1)
      | (x::xs, Some y) ->
          if x = y then encode' xs v (n + 1)
          else (y, n)::(encode' xs (Some x) 1)
    in encode' l None 0
  in encode (factors n)

(* 37 *)
let phi_improved n = raise NotYetImplemented

(* 38 *)
let timeit f n = raise NotYetImplemented

(* 39 *)
let allPrimes n = 
  let rec allPrimes' i =
    if i > n then []
    else if isPrime i then i::(allPrimes' (i + 1))
    else allPrimes' (i + 1)
  in allPrimes' 2

(* 40 *)
let goldbach n =
  let rec goldbach' i = 
    if isPrime i && isPrime (n - i) then (i, n - i)
    else goldbach' (i + 1)
  in goldbach' 2

(* 41 *)
let goldbachList lo hi = 
  let rec goldbachList' i =
    if i >= hi then []
    else if i mod 2 = 1 then goldbachList' (i + 1)
    else (i, goldbach i)::(goldbachList' (i + 2))
  in goldbachList' lo
