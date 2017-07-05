# This file is a part of project JuliaFEM.
# License is MIT: see https://github.com/JuliaFEM/NodeNumbering.jl/blob/master/LICENSE.md

using NodeNumbering

using Base.Test

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

@testset "test calculate bandwidth of graph" begin
    bw = calculate_bw(testdata)
    @test bw == 9
end
