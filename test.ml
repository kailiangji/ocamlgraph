(*
module Int = struct 
  type t = int 
  let compare = compare 
  let hash = Hashtbl.hash 
end

module G = Fun.DirectedLabeled(Int)(Int)

let g = G.empty
let g = G.add_vertex 1 g
let g = G.add_edge_and_vertex 1 10 2 g
let g = G.add_edge_and_vertex 2 50 3 g
let g = G.add_edge_and_vertex 1 30 4 g
let g = G.add_edge_and_vertex 1 100 5 g
let g = G.add_edge_and_vertex 3 10 5 g
let g = G.add_edge_and_vertex 4 20 3 g
let g = G.add_edge_and_vertex 4 60 5 g

let g = G.remove_vertex 4 g

let gc = G.add_edge_and_vertex 5 10 1 g
let gc = G.add_vertex 6 gc

module W = struct 
  type label = int
  type t = int
  let weight x = x 
  let zero = 0
  let add = (+)
  let compare = compare
end

module Dij = Dijkstra.Make(G)(Int)(W)

let p,w = Dij.shortest_path gc 1 5

open G.Edge
open Printf

let () = List.iter (fun e -> printf "[%d -> %d]" (src e) (dst e)) p; printf "\n"
*)

(*
module Int = struct 
  type t = int 
  let compare = compare 
  let hash = Hashtbl.hash 
  let equal = (=) 
end

module G = Fun.Simple(Int)

let g = G.empty
let g = G.add_vertex 1 g
let g = G.add_vertex 2 g
let g = G.add_vertex 3 g
let g = G.add_vertex 4 g
let g = G.add_vertex 5 g
let g = G.add_vertex 6 g
let g = G.add_vertex 7 g
let g = G.add_vertex 8 g
let g = G.add_vertex 9 g
let g = G.add_vertex 10 g
let g = G.add_vertex 11 g
let g = G.add_vertex 12 g
let g = G.add_vertex 13 g
let g = G.add_vertex 14 g
let g = G.add_vertex 15 g


let g = G.add_edge 1 2 g
let g = G.add_edge 1 6 g
let g = G.add_edge 2 3 g
let g = G.add_edge 2 4 g
let g = G.add_edge 2 5 g
let g = G.add_edge 3 1 g
let g = G.add_edge 4 3 g
let g = G.add_edge 4 5 g
let g = G.add_edge 5 1 g
let g = G.add_edge 6 7 g
let g = G.add_edge 6 10 g
let g = G.add_edge 6 11 g
let g = G.add_edge 7 5 g
let g = G.add_edge 7 8 g
let g = G.add_edge 7 9 g
let g = G.add_edge 8 5 g
let g = G.add_edge 9 8 g
let g = G.add_edge 10 11 g
let g = G.add_edge 12 10 g
let g = G.add_edge 12 11 g
let g = G.add_edge 13 9 g
let g = G.add_edge 13 11 g
let g = G.add_edge 13 15 g
let g = G.add_edge 14 13 g
let g = G.add_edge 15 14 g


module Conv = Components.Make(G)

open Printf
let l = Conv.strongly_connected_components g 
let _ = List.iter (fun c -> Conv.S.iter (printf "%d ") c; printf "\n") l
  
*)
(*
module Int = struct 
  type t = int 
  let compare = compare 
  let hash = Hashtbl.hash 
  let equal = (=) 
  let default = 0
  let tostring v = string_of_int v
end

module UF = Unionfind.Make(Int)
module G = Persistent.Graph.ConcreteLabeled(Int)(Int)
	  
let g = G.empty

let v1 = G.V.create 1 
let g = G.add_vertex g v1
let v2 = G.V.create 2 
let g = G.add_vertex g v2
let v3 = G.V.create 3 
let g = G.add_vertex g v3
let v4 = G.V.create 4 
let g = G.add_vertex g v4
let v5 = G.V.create 5 
let g = G.add_vertex g v5
let v6 = G.V.create 6
let g = G.add_vertex g v6
let v7 = G.V.create 7
let g = G.add_vertex g v7
let v8 = G.V.create 8
let g = G.add_vertex g v8
let v9 = G.V.create 9
let g = G.add_vertex g v9
let v10 = G.V.create 10
let g = G.add_vertex g v10

let g = G.add_edge_e g (G.E.create v1 4 v4)
let g = G.add_edge_e g (G.E.create v1 11 v5)
let g = G.add_edge_e g (G.E.create v1 8 v2)

let g = G.add_edge_e g (G.E.create v2 7 v3)
let g = G.add_edge_e g (G.E.create v2 13 v5)
let g = G.add_edge_e g (G.E.create v2 9 v6)

let g = G.add_edge_e g (G.E.create v3 12 v6)
let g = G.add_edge_e g (G.E.create v3 11 v7)

let g = G.add_edge_e g (G.E.create v4 14 v5)
let g = G.add_edge_e g (G.E.create v4 17 v8)

let g = G.add_edge_e g (G.E.create v5 13 v8)
let g = G.add_edge_e g (G.E.create v5 5 v9)
let g = G.add_edge_e g (G.E.create v5 10 v6)

let g = G.add_edge_e g (G.E.create v6 9 v7)
let g = G.add_edge_e g (G.E.create v6 6 v9)
let g = G.add_edge_e g (G.E.create v6 2 v10)

let g = G.add_edge_e g (G.E.create v7 10 v10)

let g = G.add_edge_e g (G.E.create v8 3 v9)

let g = G.add_edge_e g (G.E.create v9 12 v10)

module K = Kruskal.Make(G)(Int)(UF)

open Printf
let l = K.spanningtree g 
let _ = List.iter (fun e -> printf "%d - %d\n" (G.E.src e) (G.E.dst e) ) l
	*)

module Int = struct 
  type t = int 
  let compare = compare 
  let hash = Hashtbl.hash 
  let equal = (=) 
  let default = 0
  let tostring v = string_of_int v
end

module G = Persistent.Digraph.Concrete(Int)

let g = G.empty

let v1 = G.V.create 1 
let g = G.add_vertex g v1
let v2 = G.V.create 2 
let g = G.add_vertex g v2
let v3 = G.V.create 3 
let g = G.add_vertex g v3
let v4 = G.V.create 4 
let g = G.add_vertex g v4
let v5 = G.V.create 5 
let g = G.add_vertex g v5
let v6 = G.V.create 6
let g = G.add_vertex g v6
let v7 = G.V.create 7
let g = G.add_vertex g v7
let v8 = G.V.create 8
let g = G.add_vertex g v8
let v9 = G.V.create 9
let g = G.add_vertex g v9
let v10 = G.V.create 10
let g = G.add_vertex g v10


let g = G.add_edge g v1 v8
let g = G.add_edge g v8 v1


module Toposort = Topological.Make(G)

let _ = Toposort.iter (fun v-> Printf.printf "%d " v) g
