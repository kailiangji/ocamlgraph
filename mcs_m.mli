(**
  Maximal Cardinality Search (MCS-M) algorithm
  
  Based on the article:
  Maximal Cardinality Search for Computing Minimal Triangulations of Graphs.
  by A. Berry, Jean R. S. Blair, Pinar Heggernes & Barry W. Peyton.
  
  @author Matthieu Sozeau
  @author Pierre-Loic Garoche
  
  $Id: mcs_m.mli,v 1.2 2004-10-19 15:21:44 signoles Exp $
*)

module MaximalCardinalitySearch : sig
  module P(G : Sig.P) : sig
    type edgelist = (G.V.t * G.V.t) list	  
	
    (** [mcsm g] returns a tuple [(o, e)] where [o] is a perfect elimination
      order of [g'] where [g'] is the triangulation [e] applied to [g]. *)
    val mcsm : G.t -> (int * G.V.t) list * edgelist

    (** [triangulate g] computes a triangulation of [g]
      using the MCS-M algorithm *)
    val triangulate : G.t -> G.t
  end
  module I(Gr : Sig.I) : sig
    type edgelist = (Gr.V.t * Gr.V.t) list	  
          
    (** [mcsm g] return a tuple [(o, e)] where o is a perfect elimination order
      of [g'] where [g'] is the triangulation [e] applied to [g]. *) 
    val mcsm : Gr.t -> (int * Gr.V.t) list * edgelist
          
    (** [triangulate g] triangulates [g] using the MCS-M algorithm *)
    val triangulate : Gr.t -> unit
  end
end