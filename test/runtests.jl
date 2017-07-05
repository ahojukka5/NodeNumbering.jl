# This file is a part of project JuliaFEM.
# License is MIT: see https://github.com/JuliaFEM/NodeNumbering.jl/blob/master/LICENSE.md

using NodeNumbering

using Base.Test

#= testdata from: https://people.sc.fsu.edu/~jburkardt/m_src/rcm/rcm.html
           5--7--6
           |  | /
        4--8--2
        |  |  |
        9--1--3
=#

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
Create adjacency graph.

Parameters
----------
elements: dict of element connectivities
element_types: dict of element types

Returns
-------
dict, where key is node id and value is list of adjacent nodes, e.g.
8 => [1, 2, 4, 5] and so on.
"""
function create_adjacency_graph(elements::Dict{Int, Vector{Int}}, element_types::Dict{Int, Vector{Symbol}})
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

"""
Calculate bandwidth of adjacency graph.

Parameters
----------
elements: dict of element connectivities
element_types: dict of element types

Returns
-------
Integer

Notes
-----
[1] https://en.wikipedia.org/wiki/Band_matrix
"""
function calculate_bandwidth(elements::Dict{Int, Vector{Int}}, element_types::Dict{Int, Vector{Symbol}})
    # write code here
    println(elements)
    println(element_types)
end

elements = Dict{Int, Vector{Int}}(
    1 => [9, 1, 8, 4],
    2 => [1, 3, 2, 8],
    3 => [2, 7, 5, 8],
    4 => [2, 6, 7])

element_types = Dict{Int, Vector{Symbol}}(
    1 => :Quad4,
    2 => :Quad4,
    3 => :Quad4,
    4 => :Tri3)

@testset "test elementary functions" begin
    @test are_neighbour_nodes(elements[1], element_types[1], 9, 1) == true
    @test are_neighbour_nodes(elements[1], element_types[1], 9, 8) == false
    @test is_connected(elements, element_types, 1, 3) == true
    @test is_connected(elements, element_types, 1, 2) == false
end

@testset "create adjacency matrix" begin
    expected = [
        1 0 1 0 0 0 0 1 1
        0 1 1 0 0 1 1 1 0
        1 1 1 0 0 0 0 0 0
        0 0 0 1 0 0 0 1 1
        0 0 0 0 1 0 1 1 0
        0 1 0 0 0 1 1 0 0
        0 1 0 0 1 1 1 0 0
        1 1 0 1 1 0 0 1 0
        1 0 0 1 0 0 0 0 1
       ]
    adj = create_adjacency_matrix(elements, element_types)
    @test adj == expected
end

@testset "create adjacency graph" begin
    expected = Dict(
        1 => [3, 8, 9],
        2 => [3, 8, 7],
        3 => [1, 2],
        4 => [8, 9],
        5 => [7, 8],
        6 => [2, 7],
        7 => [5, 2, 6],
        8 => [1, 2, 4, 5],
        9 => [1, 4])
    result = create_adjacency_graph(elements, element_types)
    @test result == expected
end

@testset "test calculate bandwidth of graph" begin
    bw = calculate_bandwidth(elements, element_types)
    @test bw == 9
end
