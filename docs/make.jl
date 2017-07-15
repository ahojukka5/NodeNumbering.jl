# This file is a part of project JuliaFEM.
# License is MIT: see https://github.com/JuliaFEM/NodeNumbering.jl/blob/master/LICENSE

Pkg.add("Documenter")
using Documenter
push!(LOAD_PATH, "../src/")
using NodeNumbering
makedocs(modules = [NodeNumbering])
