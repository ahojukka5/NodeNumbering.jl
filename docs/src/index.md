# NodeNumbering.jl documentation

```@contents
```

```@meta
DocTestSetup = quote
    using NodeNumbering: calculate_bandwidth
    using NodeNumbering: create_adjacency_graph
    using NodeNumbering: RCM
    using NodeNumbering: node_degrees
    using NodeNumbering: renumbering
    using NodeNumbering: create_RCM_adjacency
    using NodeNumbering: adjacency_visualization
    using NodeNumbering: RCM_unconnected
end
```

## Constants

```@docs
NodeNumbering.element_adjacencies
```

## Functions

```@docs
NodeNumbering.RCM_unconnected(adjacency::Dict{Int, Vector{Int}}, degrees::Dict{Int, Int}, P, Q, R)
NodeNumbering.adjacency_visualization(RCM_adjacency::Dict{Int, Vector{Int}})
NodeNumbering.create_RCM_adjacency(adjacency::Dict{Int,Vector{Int}}, finalorder::Dict{Int,Int})
NodeNumbering.renumbering(neworder::Array{Int})
NodeNumbering.node_degrees(adjacency::Dict{Int, Vector{Int}})
NodeNumbering.calculate_bandwidth(G::Dict{Int, Vector{Int}})
NodeNumbering.RCM(adjacency::Dict{Int, Vector{Int}}, degrees::Dict{Int, Int}, P::Int)
NodeNumbering.create_adjacency_graph(elements::Dict{Int, Vector{Int}}, element_types::Dict{Int, Symbol})
```

## Index

```@index
```

