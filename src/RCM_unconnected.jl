# This file is a part of JuliaFEM.
# License is MIT: see https://github.com/JuliaFEM/NodeNumbering.jl/blob/master/LICENSE

"""
    RCM(adjacency::Dict{Int, Vector{Int}}, degrees::Dict{Int, Int}, P::Int)

Calculate the Reverse Cuthill-McKee Algorithm for the adjacency graph.

# Examples

```jldoctest
julia> adjacency = Dict(
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

julia> degrees = Dict(
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

julia> P = 9;

julia> RCM(adjacency, degrees, P)
13-element Array{Int64,1}:
 6
 7
 2
 5
 3
 8
 1
 4
 9
 10
 11
 12
 11

```

# References

* Wikipedia contributors. "Cuthill–McKee algorithm". Wikipedia, The Free Encyclopedia. Wikipedia, The Free Encyclopedia, 11 Jul. 2017. Web. 17 Jul. 2017. https://en.wikipedia.org/wiki/Cuthill%E2%80%93McKee_algorithm
"""
function RCM(adjacency::Dict{Int, Vector{Int}}, degrees::Dict{Int, Int}, P::Int)
    n = length(adjacency)
    R = Int[P]  # Creating the CM-ordered list
    for i=1:n
        t = sort(adjacency[R[i]], by=j->degrees[j])
        for T in t
            if !(T in R)
                push!(R, T)
            end
        end
    end
    new_order = reverse(R)
    return new_order
end
