# This file is a part of project JuliaFEM.
# License is MIT: see https://github.com/JuliaFEM/NodeNumbering.jl/blob/master/LICENSE

using Documenter
using NodeNumbering

makedocs(
    modules = [NodeNumbering],
    checkdocs = :all,
    strict = true)

deploydocs(
    deps = Deps.pip("mkdocs", "python-markdown-math"),
    repo = "github.com/JuliaFEM/NodeNumbering.jl.git")
