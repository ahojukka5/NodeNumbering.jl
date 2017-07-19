# This file is a part of JuliaFEM.
# License is MIT: see https://github.com/JuliaFEM/NodeNumbering.jl/blob/master/LICENSE

using NodeNumbering

P = 9

adjacency = Dict(
    1 => [3, 8, 9],
    2 => [3, 8, 7, 6],
    3 => [1, 2],
    4 => [8, 9],
    5 => [7, 8],
    6 => [2, 7],
    7 => [5, 2, 6],
    8 => [1, 2, 4, 5],
    9 => [1, 4])

degrees = Dict(
    1 => 3,
    2 => 4,
    3 => 2,
    4 => 2,
    5 => 2,
    6 => 2,
    7 => 3,
    8 => 4,
    9 => 2)

@testset "The Reverse Cuthill-McKee algorithm" begin
    expected = [6,7,2,5,3,8,1,4,9]
    result = NodeNumbering.RCM(adjacency, degrees, P)
    @test result == expected
end
