# This file is a part of project JuliaFEM.
# License is MIT: see https://github.com/JuliaFEM/NodeNumbering.jl/blob/master/LICENSE.md

"""
    RCM(adjacency, degrees, P)

Calculate the Reverse Cuthill-McKee Algorithm for the adjacency graph.

# Parameters
adjacency = A Dict where the keys are node numbers and the values are lists of adjacent nodes.
degrees = A Dict where the keys are node numbers and the values are degrees of the nodes.
P = The starting node for the algorithm. It is one of the lowest degree nodes in the graph.

# Returns
new_order = A list where the nodes are ordered with the RCM Algorithm.

# References
[1] https://en.wikipedia.org/wiki/Cuthill%E2%80%93McKee_algorithm
"""
function RCM(adjacency::Dict{Int, Vector{Int}}, degrees::Dict{Int, Int}, P::Int)::Vector{Int}
    n = length(adjacency)
    R = Int[P]  # Creating the CM-ordered list
    for i=1:n
        t = sort(adjacency[R[i]], by=j->degrees[j])
        for T in t
            if !(T in R)
                push!(R, T)
            end
        end
    end
    new_order = reverse(R)
    return new_order
end
