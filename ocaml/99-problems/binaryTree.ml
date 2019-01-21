exception NotYetImplemented

type 'a binary_tree =
    Empty
  | Node of 'a binary_tree * 'a * 'a binary_tree

let cbal_tree n = raise NotYetImplemented

let isSymmetric t =
  let rec isMirror t1 t2 = match (t1, t2) with
      (Empty, Empty) -> true
    | (Node(l1, _, r1), Node(l2, _, r2)) -> (isMirror l1 r2) && (isMirror l2 r1)
    | _ -> false
  in isMirror t t

let construct l = raise NotYetImplemented