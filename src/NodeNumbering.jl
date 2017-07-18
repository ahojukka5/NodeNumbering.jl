# This file is a part of project JuliaFEM.
# License is MIT: see https://github.com/JuliaFEM/NodeNumbering.jl/blob/master/LICENSE

module NodeNumbering

include("calc_bw.jl")
include("create_adjacency_graph.jl")
include("node_degrees.jl")
include("RCM.jl")

end
