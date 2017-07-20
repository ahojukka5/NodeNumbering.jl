# This file is a part of JuliaFEM.
# License is MIT: see https://github.com/JuliaFEM/NodeNumbering.jl/blob/master/LICENSE

using NodeNumbering

using Base.Test

function get_test_data()
    #= testdata from:
    https://people.sc.fsu.edu/~jburkardt/m_src/rcm/rcm.html

       5--7--6
       |  | /
    4--8--2
    |  |  |
    9--1--3

    =#

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

    return elements, element_types

end

#=

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
=#

# add unit test files to this list:
test_files = String[]
push!(test_files, "test_calc_bw.jl")
push!(test_files, "test_create_adjacency_graph.jl")
push!(test_files, "test_node_degrees.jl")
push!(test_files, "test_RCM.jl")
push!(test_files, "test_create_RCM_adjacency.jl")
push!(test_files, "test_renumbering.jl")
push!(test_files, "test_adjacency_visualization.jl")

using TimerOutputs
const to = TimerOutput()
@testset "NodeNumbering.jl" begin
    for fn in test_files
        timeit(to, fn) do
            include(fn)
        end
    end
end
println()
println("Test statistics:")
println(to)
