# This file is a part of JuliaFEM.
# License is MIT: see https://github.com/JuliaFEM/NodeNumbering.jl/blob/master/LICENSE

using NodeNumbering

P = 9

adjacency = Dict(
  2  => [6, 7, 3, 8],
  11 => [10, 12],
  7  => [2, 6, 5],
  9  => [1, 4],
  10 => [11, 13],
  8  => [1, 2, 5, 4],
  6  => [2, 7],
  4  => [9, 8],
  3  => [1, 2],
  5  => [8, 7],
  13 => [10, 12],
  12 => [11, 13],
  1  => [3, 8, 9]);


degrees = Dict(
    1 => 3,
    2 => 4,
    3 => 2,
    4 => 2,
    5 => 2,
    6 => 2,
    7 => 3,
    8 => 4,
    9 => 2,
    10 => 2,
    11 => 2,
    12 => 2,
    13 => 2);

@testset "The Reverse Cuthill-McKee algorithm for an unconnected graph" begin
    expected = [6,7,2,5,3,8,1,4,9,10,11,12,13]
    result = NodeNumbering.RCM(adjacency, degrees, P)
    @test result == expected
end
