# NodeNumbering.jl documentation

```@contents
```

```@meta
DocTestSetup = quote
    using NodeNumbering: calculate_bandwidth
    using NodeNumbering: create_adjacency_graph
    using NodeNumbering: RCM
    using NodeNumbering: node_degrees
end
```

## Constants

```@docs
NodeNumbering.element_adjacencies
```

## Functions

```@docs
NodeNumbering.node_degrees(adjacency::Dict{Int, Vector{Int}})
NodeNumbering.calculate_bandwidth(G::Dict{Int, Vector{Int}})
NodeNumbering.RCM(adjacency::Dict{Int, Vector{Int}}, degrees::Dict{Int, Int}, P::Int)
NodeNumbering.create_adjacency_graph(elements::Dict{Int, Vector{Int}}, element_types::Dict{Int, Symbol})
```

## Index

```@index
```

