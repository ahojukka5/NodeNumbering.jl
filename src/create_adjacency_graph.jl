# This file is a part of project JuliaFEM.
# License is MIT: see https://github.com/JuliaFEM/NodeNumbering.jl/blob/master/LICENSE

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
global const element_adjacencies = Dict{Symbol, Vector{Vector{Int}}}(
   :Quad4 => [[2, 4], [1, 3], [2, 4], [1, 3]],
   :Tri3 => [[2,3], [1,3], [1,2]],
   :Tet4 => [[2,3,4], [1,3,4], [1,2,4], [1,2,3]])

function create_adjacency_graph(elements::Dict{Int, Vector{Int}}, element_types::Dict{Int, Symbol})
    neighbours = Dict{Int, Vector{Int}}()
    for (k, nodes) in elements
        eltype = element_types[k]
        neighbour_indices = element_adjacencies[eltype]
        for (i, node) in enumerate(nodes)
            node_neighbours = nodes[neighbour_indices[i]]
            if haskey(neighbours, node)
                 for nodei in node_neighbours
                    if (nodei in neighbours[node]) == false
                       push!(neighbours[node], nodei)
                    end
                end
            else
                neighbours[node] = node_neighbours
            end
        end
    end
    return neighbours
end
