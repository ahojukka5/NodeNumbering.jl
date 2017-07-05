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

function are_neighbour_nodes(elcon::Vector{Int}, eltype::Symbol, i::Int, j::Int)
    # write code here
    println(elcon)
    println(eltype)
    println(i)
    println(j)
end

function is_connected(elements::Dict{Int, Vector{Int}}, element_types::Dict{Int, Vector{Symbol}})
    # write code here
    println(elements)
    println(element_types)
end

function create_adjacency_matrix(elements::Dict{Int, Vector{Int}}, element_types::Dict{Int, Vector{Symbol}})
    # write code here
    println(elements)
    println(element_types)
end

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

@testset "test calculate bandwidth of graph" begin
    bw = calculate_bandwidth(elements, element_types)
    @test bw == 9
end
