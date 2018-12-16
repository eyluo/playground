type tree = Empty | Node of (tree * int * tree)

let rec preOrder t = match t with
    Empty -> []
  | Node(l, x, r) -> x::(preOrder l @ preOrder r)

let rec inOrder t = match t with
    Empty -> []
  | Node(l, x, r) -> inOrder l @ x::(inOrder r)

let rec postOrder t = match t with
    Empty -> []
  | Node(l, x, r) -> (postOrder l @ postOrder r) @ [x]