exception NotYetImplemented

type bool_expr =
    Var of string
  | Not of bool_expr
  | And of bool_expr * bool_expr
  | Or of bool_expr * bool_expr

(* 46 47 *)
let table2 a b eq =
  let rec evalBool boolA boolB boolExp = match boolExp with
      Var s -> if s = a then boolA else if s = b then boolB else raise Not_found
    | Not x -> not (evalBool boolA boolB x)
    | And (x, y) -> (evalBool boolA boolB x) && (evalBool boolA boolB y) 
    | Or (x, y) -> (evalBool boolA boolB x) || (evalBool boolA boolB y)
  in [(true, true, evalBool true true eq); 
      (true, false, evalBool true false eq); 
      (false, true, evalBool false true eq); 
      (false, false, evalBool false false eq)]

(* 48 *)
let table s eq = raise NotYetImplemented