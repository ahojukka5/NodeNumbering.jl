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
    "location": "api.html#NodeNumbering.adjacency_visualization-Tuple{Dict{Int64,Array{Int64,1}}}",
    "page": "API",
    "title": "NodeNumbering.adjacency_visualization",
    "category": "Method",
    "text": "adjacency_visualization(RCM_adjacency::Dict{Int, Vector{Int}})\n\nVisualizes adjacency graph Dicts as matrices. Result can be plotted using PyPlot function matshow(). A part of the Reverse Cuthill-McKee Algorithm.\n\nExamples\n\njulia> RCM_adjacency = Dict{Int, Vector{Int}}(\n                       7 => [5, 6, 9],\n                       9 => [7, 8],\n                       4 => [2, 6],\n                       2 => [4, 3, 1],\n                       3 => [5, 6, 2, 1],\n                       8 => [6, 9],\n                       5 => [7, 3],\n                       6 => [7, 3, 8, 4],\n                       1 => [3, 2]);\n\njulia> adjacency_visualization(RCM_adjacency)\n9×9 Array{Float64,2}:\n 1.0  1.0  1.0  0.0  0.0  0.0  0.0  0.0  0.0\n 1.0  1.0  1.0  1.0  0.0  0.0  0.0  0.0  0.0\n 1.0  1.0  1.0  0.0  1.0  1.0  0.0  0.0  0.0\n 0.0  1.0  0.0  1.0  0.0  1.0  0.0  0.0  0.0\n 0.0  0.0  1.0  0.0  1.0  0.0  1.0  0.0  0.0\n 0.0  0.0  1.0  1.0  0.0  1.0  1.0  1.0  0.0\n 0.0  0.0  0.0  0.0  1.0  1.0  1.0  0.0  1.0\n 0.0  0.0  0.0  0.0  0.0  1.0  0.0  1.0  1.0\n 0.0  0.0  0.0  0.0  0.0  0.0  1.0  1.0  1.0\n\n\n\n\n"
},

{
    "location": "api.html#NodeNumbering.create_RCM_adjacency-Tuple{Dict{Int64,Array{Int64,1}},Dict{Int64,Int64}}",
    "page": "API",
    "title": "NodeNumbering.create_RCM_adjacency",
    "category": "Method",
    "text": "create_RCM_adjacency(adjacency::Dict{Int, Vector{Int}}, finalorder::Dict{Int, Int})\n\nCreate an adjacency Dict of the RCM ordered nodes. A part of the Reverse Cuthill-McKee Algorithm.\n\nExamples\n\njulia> adjacency = Dict{Int, Vector{Int}}(\n                   1 => [3, 8, 9],\n                   2 => [3, 8, 7, 6],\n                   3 => [1, 2],\n                   4 => [8, 9],\n                   5 => [7, 8],\n                   6 => [2, 7],\n                   7 => [5, 2, 6],\n                   8 => [1, 2, 4, 5],\n                   9 => [1, 4]);\n\njulia> finalorder =  Dict{Int, Int}(\n                     7 => 2,\n                     9 => 9,\n                     4 => 8,\n                     2 => 3,\n                     3 => 5,\n                     5 => 4,\n                     8 => 6,\n                     6 => 1,\n                     1 => 7);\n\njulia> create_RCM_adjacency(adjacency, finalorder)\nDict{Int64,Array{Int64,1}} with 9 entries:\n  7 => [5, 6, 9]\n  9 => [7, 8]\n  4 => [2, 6]\n  2 => [4, 3, 1]\n  3 => [5, 6, 2, 1]\n  8 => [6, 9]\n  5 => [7, 3]\n  6 => [7, 3, 8, 4]\n  1 => [3, 2]\n\n\nReferences\n\nWikipedia contributors. \"Adjacency list\". Wikipedia, The Free Encyclopedia. Wikipedia, The Free Encyclopedia, 7 Jun. 2017. Web. 17 Jul. 2017. https://en.wikipedia.org/wiki/Adjacency_list\n\n\n\n"
},

{
    "location": "api.html#NodeNumbering.renumbering-Tuple{Array{Int64,N} where N}",
    "page": "API",
    "title": "NodeNumbering.renumbering",
    "category": "Method",
    "text": "renumbering(neworder::Array{Int})\n\nRenumber the RCM ordered nodes. A part of the Reverse Cuthill-McKee Algorithm.\n\nExamples\n\njulia> neworder = Int[6, 7, 2, 5, 3, 8, 1, 4, 9];\n\njulia> renumbering(neworder)\nDict{Int64,Int64} with 9 entries:\n  7 => 2\n  9 => 9\n  4 => 8\n  2 => 3\n  3 => 5\n  5 => 4\n  8 => 6\n  6 => 1\n  1 => 7\n\n\nReferences\n\nWikipedia contributors. \"Cuthill–McKee algorithm\". Wikipedia, The Free Encyclopedia. Wikipedia, The Free Encyclopedia, 11 Jul. 2017. Web. 20 Jul. 2017. https://en.wikipedia.org/wiki/Cuthill%E2%80%93McKee_algorithm\n\n\n\n"
},

{
    "location": "api.html#NodeNumbering.node_degrees-Tuple{Dict{Int64,Array{Int64,1}}}",
    "page": "API",
    "title": "NodeNumbering.node_degrees",
    "category": "Method",
    "text": "node_degrees(adjacency::Dict{Int, Vector{Int}})\n\nCalculate the degrees for the adjacency graph nodes. Node degree = number of nodes a certain node is adjacent to.\n\nExamples\n\njulia> adjacency = Dict{Int, Vector{Int}}(\n                   1 => [3, 8, 9],\n                   2 => [3, 8, 7],\n                   3 => [1, 2],\n                   4 => [8, 9],\n                   5 => [7, 8],\n                   6 => [2, 7],\n                   7 => [5, 2, 6],\n                   8 => [1, 2, 4, 5],\n                   9 => [1, 4]);\n\njulia> node_degrees(adjacency::Dict{Int, Vector{Int}})\nDict{Int64,Int64} with 9 entries:\n  7 => 3\n  4 => 2\n  9 => 2\n  2 => 3\n  3 => 2\n  5 => 2\n  8 => 4\n  6 => 2\n  1 => 3\n\n\nReferences\n\nWikipedia contributors. \"Degree (graph theory)\". Wikipedia, The Free Encyclopedia. 24 Nov. 2016. Web. 18 Jul. 2017. https://en.wikipedia.org/wiki/Degree_(graph_theory)\n\n\n\n"
},

{
    "location": "api.html#NodeNumbering.calculate_bandwidth-Tuple{Dict{Int64,Array{Int64,1}}}",
    "page": "API",
    "title": "NodeNumbering.calculate_bandwidth",
    "category": "Method",
    "text": "calculate_bandwidth(G::Dict{Int, Vector{Int}})\n\nCalculate bandwidth of graph G. The bandwidth of the matrix is number k such that A_ij = 0 if i-j  k.\n\nExamples\n\njulia> G = Dict(\n           1 => [3, 8, 9],\n           2 => [3, 8, 7],\n           3 => [1, 2],\n           4 => [8, 9],\n           5 => [7, 8],\n           6 => [2, 7],\n           7 => [5, 2, 6],\n           8 => [1, 2, 4, 5],\n           9 => [1, 4]);\n\njulia> calculate_bandwidth(G)\n17\n\n\nReferences\n\nWikipedia contributors. \"Band matrix.\" Wikipedia, The Free Encyclopedia. Wikipedia, The Free Encyclopedia, 28 Apr. 2017. Web. 15 Jul. 2017. https://en.wikipedia.org/wiki/Band_matrix.\n\n\n\n"
},

{
    "location": "api.html#NodeNumbering.RCM-Tuple{Dict{Int64,Array{Int64,1}},Dict{Int64,Int64},Int64}",
    "page": "API",
    "title": "NodeNumbering.RCM",
    "category": "Method",
    "text": "RCM(adjacency::Dict{Int, Vector{Int}}, degrees::Dict{Int, Int}, P::Int)\n\nCalculate the Reverse Cuthill-McKee Algorithm for the adjacency graph.\n\nExamples\n\njulia> adjacency = Dict(\n                   1 => [3, 8, 9],\n                   2 => [3, 8, 7],\n                   3 => [1, 2],\n                   4 => [8, 9],\n                   5 => [7, 8],\n                   6 => [2, 7],\n                   7 => [5, 2, 6],\n                   8 => [1, 2, 4, 5],\n                   9 => [1, 4]);\n\njulia> degrees = Dict(\n                 1 => 3,\n                 2 => 4,\n                 3 => 2,\n                 4 => 2,\n                 5 => 2,\n                 6 => 2,\n                 7 => 3,\n                 8 => 4,\n                 9 => 2);\n\njulia> P = 9;\n\njulia> RCM(adjacency, degrees, P)\n9-element Array{Int64,1}:\n 6\n 7\n 2\n 5\n 3\n 8\n 1\n 4\n 9\n\n\nReferences\n\nWikipedia contributors. \"Cuthill–McKee algorithm\". Wikipedia, The Free Encyclopedia. Wikipedia, The Free Encyclopedia, 11 Jul. 2017. Web. 17 Jul. 2017. https://en.wikipedia.org/wiki/Cuthill%E2%80%93McKee_algorithm\n\n\n\n"
},

{
    "location": "api.html#NodeNumbering.create_adjacency_graph-Tuple{Dict{Int64,Array{Int64,1}},Dict{Int64,Symbol}}",
    "page": "API",
    "title": "NodeNumbering.create_adjacency_graph",
    "category": "Method",
    "text": "create_adjacency_graph(elements::Dict{Int, Vector{Int}}, element_types::Dict{Int, Symbol})\n\nCreate a Dict that shows all nodes and their adjacencies.\n\nExamples\n\njulia> elements = Dict(\n                  1 => [9, 1, 8, 4],\n                  2 => [1, 3, 2, 8],\n                  3 => [8, 2, 7, 5],\n                  4 => [2, 6, 7]);\n\njulia> element_types = Dict(\n                       1 => :Quad4,\n                       2 => :Quad4,\n                       3 => :Quad4,\n                       4 => :Tri3);\n\njulia> create_adjacency_graph(elements, element_types)\nDict{Int64,Array{Int64,1}} with 9 entries:\n  7 => [2, 6, 5]\n  9 => [1, 4]\n  4 => [9, 8]\n  2 => [6, 7, 3, 8]\n  3 => [1, 2]\n  8 => [1, 2, 5, 4]\n  5 => [8, 7]\n  6 => [2, 7]\n  1 => [3, 8, 9]\n\n\nReferences\n\nWikipedia contributors. \"Adjacency list\". Wikipedia, The Free Encyclopedia. Wikipedia, The Free Encyclopedia, 7 Jun. 2017. Web. 17 Jul. 2017. https://en.wikipedia.org/wiki/Adjacency_list\n\n\n\n"
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
