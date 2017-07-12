# This file is a part of project JuliaFEM.
# License is MIT: see https://github.com/JuliaFEM/NodeNumbering.jl/blob/master/LICENSE.md

"""
Calculate bandwidth of adjacency graph G.

Parameters
----------
G   Dict; key is node number and value is a list of adjacent nodes

Returns
-------
Integer

Notes
-----
[1] https://en.wikipedia.org/wiki/Band_matrix
"""
function calculate_bandwidth(G::Dict{Int, Vector{Int}})
    return 2*maximum([maximum(j-g) for (j,g) in G]) + 1
end
