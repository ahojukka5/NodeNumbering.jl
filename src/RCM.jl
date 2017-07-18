# This file is a part of project JuliaFEM.
# License is MIT: see https://github.com/JuliaFEM/NodeNumbering.jl/blob/master/LICENSE.md

"""
    RCM(adjacency::Dict{Int, Vector{Int}}, degrees::Dict{Int, Int}, P::Int)

Calculate the Reverse Cuthill-McKee Algorithm for the adjacency graph.

# Examples

```jldoctest
julia> adjacency = Dict(
                   1 => [3, 8, 9],
                   2 => [3, 8, 7],
                   3 => [1, 2],
                   4 => [8, 9],
                   5 => [7, 8],
                   6 => [2, 7],
                   7 => [5, 2, 6],
                   8 => [1, 2, 4, 5],
                   9 => [1, 4]);

julia> P = 9

julia> RCM(adjacency, degrees, P)
[6,7,2,5,3,8,1,4,9]
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
