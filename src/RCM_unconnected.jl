# This file is a part of JuliaFEM.
# License is MIT: see https://github.com/JuliaFEM/NodeNumbering.jl/blob/master/LICENSE

"""
    RCM_unconnected(adjacency::Dict{Int, Vector{Int}}, degrees::Dict{Int, Int}, P, Q, R)

Calculate the Reverse Cuthill-McKee Algorithm for an unconnected adjacency graph. P, Q and R are given.

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

julia> Q = 9;

julia> R = 9;

julia> RCM_unconnected(adjacency, degrees, P, Q, R)
13-element Array{Int64,1}:
 10
 13
 12
 11
 6
 7
 2
 5
 3
 8
 1
 4
 9

```

# References

* Wikipedia contributors. "Cuthill–McKee algorithm". Wikipedia, The Free Encyclopedia. Wikipedia, The Free Encyclopedia, 11 Jul. 2017. Web. 17 Jul. 2017. https://en.wikipedia.org/wiki/Cuthill%E2%80%93McKee_algorithm
"""
function RCM_unconnected(adjacency::Dict{Int, Vector{Int}}, degrees::Dict{Int, Int}, P, Q, R)
    n=length(adjacency)
    println("n = ", n)
    colored = Int[]
    push!(colored, P)
    for i=1:n
        println("i = ", i)
        if length(colored) < i
          println("i! = ", i)
          i = (i-1)
          println("length! = ", length(colored))
          push!(colored, Q, R)
          continue
        else
          t=adjacency[colored[i]]
          sort!(t, by=j->degrees[j])
          for T in t
            if in(T, colored) == false
              push!(colored, T)
              #delete!(degrees, T)
            end
          end
        end
    end
    neworder = reverse(colored)
    return neworder
end
