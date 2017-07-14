# This file is a part of project JuliaFEM.
# License is MIT: see https://github.com/JuliaFEM/NodeNumbering.jl/blob/master/LICENSE.md

"""
Calculate the Reverse Cuthill-McKee Algorithm for the adjacency graph G.

Parameters
----------
G   Dict; key is node number and value is a list of adjacent nodes

Returns
-------
Integer

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
