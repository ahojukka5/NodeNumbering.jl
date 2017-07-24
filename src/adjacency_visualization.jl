# This file is a part of JuliaFEM.
# License is MIT: see https://github.com/JuliaFEM/NodeNumbering.jl/blob/master/LICENSE

"""
    adjacency_visualization(RCM_adjacency::Dict{Int, Vector{Int}})

<<<<<<< HEAD
Visualizes adjacency graph Dicts as matrices. Uses PyPlot function matshow(). A part of the Reverse Cuthill-McKee Algorithm.
=======
Visualizes adjacency graph Dicts as matrices. Result can be plotted using `PyPlot` function `matshow()`.
A part of the Reverse Cuthill-McKee Algorithm.
>>>>>>> 820bac22b14dbfe9cbbdb49a0f90099befb5b7c1

# Examples

```jldoctest
<<<<<<< HEAD
julia> using PyPlot

=======
>>>>>>> 820bac22b14dbfe9cbbdb49a0f90099befb5b7c1
julia> RCM_adjacency = Dict{Int, Vector{Int}}(
                       7 => [5, 6, 9],
                       9 => [7, 8],
                       4 => [2, 6],
                       2 => [4, 3, 1],
                       3 => [5, 6, 2, 1],
                       8 => [6, 9],
                       5 => [7, 3],
                       6 => [7, 3, 8, 4],
                       1 => [3, 2]);

julia> adjacency_visualization(RCM_adjacency)
9×9 Array{Float64,2}:
 1.0  1.0  1.0  0.0  0.0  0.0  0.0  0.0  0.0
 1.0  1.0  1.0  1.0  0.0  0.0  0.0  0.0  0.0
 1.0  1.0  1.0  0.0  1.0  1.0  0.0  0.0  0.0
 0.0  1.0  0.0  1.0  0.0  1.0  0.0  0.0  0.0
 0.0  0.0  1.0  0.0  1.0  0.0  1.0  0.0  0.0
 0.0  0.0  1.0  1.0  0.0  1.0  1.0  1.0  0.0
 0.0  0.0  0.0  0.0  1.0  1.0  1.0  0.0  1.0
 0.0  0.0  0.0  0.0  0.0  1.0  0.0  1.0  1.0
 0.0  0.0  0.0  0.0  0.0  0.0  1.0  1.0  1.0

```
"""
function adjacency_visualization(RCM_adjacency::Dict{Int, Vector{Int}})
    m=eye(length(RCM_adjacency))
    for (k, v) in RCM_adjacency
        for i in v
          m[k, i]=1
        end
    end
<<<<<<< HEAD
    matshow(m)
=======
>>>>>>> 820bac22b14dbfe9cbbdb49a0f90099befb5b7c1
    return m
end
