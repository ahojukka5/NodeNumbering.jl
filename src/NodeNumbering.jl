# This file is a part of project JuliaFEM.
# License is MIT: see https://github.com/JuliaFEM/NodeNumbering.jl/blob/master/LICENSE

module NodeNumbering

"""
Determine are nodes i and j neighbours in element.

Parameters
----------
elcon: element connectivity
eltype: element type (:Tri3, :Quad4 and so on)
i, j: node ids

Returns
-------
true   if i and j are neighbour nodes inside element
false  otherwise
"""
function are_neighbour_nodes(elcon::Vector{Int}, eltype::Symbol, i::Int, j::Int)
    # write code here
    println(elcon)
    println(eltype)
    println(i)
    println(j)
end

"""
Given a list of elements, determine are i and j neighbours.

Parameters
----------
elements: dict of element connectivities
element_types: dict of element types
i, j: node ids

Returns
-------
true   if i and j are neighbours (aka connected edge)
false  otherwise
"""
function is_connected(elements::Dict{Int, Vector{Int}}, element_types::Dict{Int, Vector{Symbol}}, i::Int, j::Int)
    # write code here
    println(elements)
    println(element_types)
end


"""
Create adjacency matrix from adjacency graph.

Parameters
----------
elements: dict of element connectivities
element_types: dict of element types

Returns
-------
SparseMatrixCSC{Int}

Notes
-----
[1] https://en.wikipedia.org/wiki/Adjacency_matrix
"""
function create_adjacency_matrix(elements::Dict{Int, Vector{Int}}, element_types::Dict{Int, Vector{Symbol}})
    # write code here
    println(elements)
    println(element_types)
end

include("calc_bw.jl")
include("create_adjacency_graph.jl")

end
