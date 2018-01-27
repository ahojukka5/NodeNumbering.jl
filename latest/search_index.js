var documenterSearchIndex = {"docs": [

{
    "location": "index.html#",
    "page": "Introduction",
    "title": "Introduction",
    "category": "page",
    "text": ""
},

{
    "location": "index.html#NodeNumbering.jl-documentation-1",
    "page": "Introduction",
    "title": "NodeNumbering.jl documentation",
    "category": "section",
    "text": "Pages = [\"index.md\", \"theory.md\", \"api.md\"]Write package description here."
},

{
    "location": "index.html#Installing-and-testing-package-1",
    "page": "Introduction",
    "title": "Installing and testing package",
    "category": "section",
    "text": "Installing package goes same way like other packages in julia, i.e.julia> Pkg.add(\"NodeNumbering\")Testing package can be done using Pkg.test, i.e.julia> Pkg.test(\"NodeNumbering\")"
},

{
    "location": "theory.html#",
    "page": "Theory",
    "title": "Theory",
    "category": "page",
    "text": ""
},

{
    "location": "theory.html#Theory-1",
    "page": "Theory",
    "title": "Theory",
    "category": "section",
    "text": "RCM, how it works?"
},

{
    "location": "api.html#",
    "page": "API",
    "title": "API",
    "category": "page",
    "text": ""
},

{
    "location": "api.html#API-documentation-1",
    "page": "API",
    "title": "API documentation",
    "category": "section",
    "text": "DocTestSetup = quote\n    using NodeNumbering: calculate_bandwidth\n    using NodeNumbering: create_adjacency_graph\n    using NodeNumbering: RCM\n    using NodeNumbering: node_degrees\n    using NodeNumbering: renumbering\n    using NodeNumbering: create_RCM_adjacency\n    using NodeNumbering: adjacency_visualization\nend"
},

{
    "location": "api.html#NodeNumbering.element_adjacencies",
    "page": "API",
    "title": "NodeNumbering.element_adjacencies",
    "category": "Constant",
    "text": "element_adjacencies\n\nThe Dict shows some element types and their node adjacencies. For example the element type Quad4 has four nodes/element so that node No. 1 is adjacent to nodes 2 and 4 etc.\n\n\n\n"
},

{
    "location": "api.html#Constants-1",
    "page": "API",
    "title": "Constants",
    "category": "section",
    "text": "NodeNumbering.element_adjacencies"
},

{
    "location": "api.html#Functions-1",
    "page": "API",
    "title": "Functions",
    "category": "section",
    "text": "NodeNumbering.adjacency_visualization(RCM_adjacency::Dict{Int, Vector{Int}})\nNodeNumbering.create_RCM_adjacency(adjacency::Dict{Int,Vector{Int}}, finalorder::Dict{Int,Int})\nNodeNumbering.renumbering(neworder::Array{Int})\nNodeNumbering.node_degrees(adjacency::Dict{Int, Vector{Int}})\nNodeNumbering.calculate_bandwidth(G::Dict{Int, Vector{Int}})\nNodeNumbering.RCM(adjacency::Dict{Int, Vector{Int}}, degrees::Dict{Int, Int}, P::Int)\nNodeNumbering.create_adjacency_graph(elements::Dict{Int, Vector{Int}}, element_types::Dict{Int, Symbol})"
},

{
    "location": "api.html#Index-1",
    "page": "API",
    "title": "Index",
    "category": "section",
    "text": ""
},

]}
