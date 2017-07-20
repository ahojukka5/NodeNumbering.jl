# This file is a part of JuliaFEM.
# License is MIT: see https://github.com/JuliaFEM/NodeNumbering.jl/blob/master/LICENSE

module NodeNumbering

include("calc_bw.jl")
include("create_adjacency_graph.jl")
include("node_degrees.jl")
include("RCM.jl")
include("renumbering.jl")
include("create_RCM_adjacency.jl")
include("adjacency_visualization.jl")

end
