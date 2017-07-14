# This file is a part of project JuliaFEM.
# License is MIT: see https://github.com/JuliaFEM/NodeNumbering.jl/blob/master/LICENSE.md

"""
    RCM(adjacency::Dict{Int, Vector{Int}}, degrees::Dict{Int, Int}, P)

Calculate the Reverse Cuthill-McKee Algorithm for the adjacency graph.

Parameters
----------
adjacency = A Dict where the keys are node numbers and the values are lists of adjacent nodes.
degrees = A Dict where the keys are node numbers and the values are degrees of the nodes.
P = The starting node for the algorithm. It is one of the lowest degree nodes in the graph.

Returns
-------
neworder = A list where the nodes are ordered with the RCM Algorithm.

Notes
-----
[1] https://en.wikipedia.org/wiki/Cuthill%E2%80%93McKee_algorithm
"""
function RCM(adjacency::Dict{Int, Vector{Int}}, degrees::Dict{Int, Int}, P)
    n=length(adjacency)
    R = Int[] #Creating the CM-ordered list
    push!(R, P) #Adding parent to the result list
    for i=1:n
        t=adjacency[R[i]]
        sort!(t, by=j->degrees[j])
        for T in t
          if in(T, R) == false
            push!(R, T)
          end
        end
    end
    println(R)
    neworder = reverse(R)
    return neworder
end
