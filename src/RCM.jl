
elements=Dict(
    1 => [9, 1, 8, 4],
    2 => [1, 3, 2, 8],
    3 => [8, 2, 7, 5],
    4 => [2, 6, 7])

element_types = Dict{Int, Symbol}(
    1 => :Quad4,
    2 => :Quad4,
    3 => :Quad4,
    4 => :Tri3)

"A function to create a dictionary of node neighbours"
function create_adjacency_graph(elements::Dict{Int, Vector{Int}}, element_types::Dict{Int, Symbol})
    neighbours = Dict{Int, Vector{Int}}()
    for (k, v) in elements
        eltype = element_types[k]
        if eltype == :Quad4
            nodes1 = elements[k][1]
            nodes2 = elements[k][2]
            nodes3 = elements[k][3]
            nodes4 = elements[k][4]
            n1_neighbours = [nodes2, nodes4]
            n2_neighbours = [nodes1, nodes3]
            n3_neighbours = [nodes2, nodes4]
            n4_neighbours = [nodes1, nodes3]
            #nodes1
            if haskey(neighbours, nodes1)
                 for nodei in n1_neighbours
                    if (nodei in neighbours[nodes1]) == false
                       push!(neighbours[nodes1], nodei)
                    end
                end
            else
              neighbours[nodes1] = n1_neighbours
            end
            #nodes2
            if haskey(neighbours, nodes2)
                 for nodei in n2_neighbours
                    if (nodei in neighbours[nodes2]) == false
                        push!(neighbours[nodes2], nodei)
                    end
                end
            else
              neighbours[nodes2] = n2_neighbours
            end
            #nodes3
            if haskey(neighbours, nodes3)
                 for nodei in n3_neighbours
                    if (nodei in neighbours[nodes3]) == false
                        push!(neighbours[nodes3], nodei)
                    end
                end
            else
              neighbours[nodes3] = n3_neighbours
            end
            #nodes4
            if haskey(neighbours, nodes4)
                 for nodei in n4_neighbours
                    if (nodei in neighbours[nodes4]) == false
                        push!(neighbours[nodes4], nodei)
                    end
                end
            else
              neighbours[nodes4] = n4_neighbours
            end
            # Check if nodesi key (and corresponding list) is found in neighbours dictionary
            #     True -> Loop through ni_neighbours (list) nodes and check if nodei is found in the list
            #          True -> Do not add nodei to the list
            #          False -> Add nodei to the list
            #     False -> Create key nodesi to the neighbours dictionary with the value of ni_neighbours (list)

        elseif eltype == :Tri3
            nodes1 = elements[k][1]
            nodes2 = elements[k][2]
            nodes3 = elements[k][3]
            n1_neighbours = [nodes2, nodes3]
            n2_neighbours = [nodes1, nodes3]
            n3_neighbours = [nodes1, nodes2]
            #nodes1
            if haskey(neighbours, nodes1)
                for nodei in n1_neighbours
                   if (nodei in neighbours[nodes1]) == false
                       push!(neighbours[nodes1], nodei)
                   end
                end
            else
                neighbours[nodes1] = n1_neighbours
            end
              #nodes2
            if haskey(neighbours, nodes2)
                 for nodei in n2_neighbours
                    if (nodei in neighbours[nodes2]) == false
                        push!(neighbours[nodes2], nodei)
                    end
                end
            else
              neighbours[nodes2] = n2_neighbours
            end
            #nodes3
            if haskey(neighbours, nodes3)
                for nodei in n3_neighbours
                    if (nodei in neighbours[nodes3]) == false
                        push!(neighbours[nodes3], nodei)
                    end
                end
            else
                neighbours[nodes3] = n3_neighbours
            end
        end
    end
    return neighbours
end

adjacency=create_adjacency_graph(elements, element_types)
println("Node adjacencies:", " ", adjacency)

"A function to create a dictionary of node degrees"
function node_degrees(adjacency::Dict{Int, Vector{Int}})
    degrees = Dict{Int, Int}()
    for (k, v) in adjacency
        degree = length(v)
        degrees[k] = degree
    end
    return degrees
end

degrees=node_degrees(adjacency)
println("Node degrees:", " ", degrees)


"The Cuthill-McKee algorithm"
#Pick up starting node
#Add starting node to cm-list
#Pick up starting node neighbours
#Create neighbour node degree dict (Q)
#Add neighbour nodes to cm-list in degree order
#Pick up the lowest degree neighbour node neighbours *
#Add to Q dict
#Add elements from Q in degree order to cm-list
#Pick up the second lowest degree neighbour node neighbours *
#Add to Q dict
#Add elements from Q in degree order to cm-list ...

function CM(adjacency::Dict{Int, Vector{Int}}, degrees::Dict{Int, Int})
    R = [] #Creating the CM-ordered list
    Q = Dict{Int, Int}() #Creating Q = queue dict
    P = collect(keys(degrees))[indmin(collect(values(degrees)))] #Picking up P = parent node from degrees
    push!(R, P) #Adding parent to the result list
    C = adjacency[P] #Picking up the prent node neighbours = children from adjacency
    println("P:s neighbour nodes = C = ", C)
    for nodes in C
      C_degree = degrees[nodes] #Figuring out cildren's degrees
      Q[nodes] = C_degree #Adding children to queue
    end

    println("Q = ", "", Q)

    for k in Q
        C2 = collect(keys(Q))[indmin(collect(values(Q)))] #Picking up the lowest degree child
        if in(C2, R) == false
          push!(R, C2) #Adding C2 to R
          println("C2 = ", C2)
          C3 = adjacency[C2] #C2 neighbour nodes = C3
          println("C2:s neighbour nodes = C3 = ", C3)
          if isempty(Q)
            for nodes in C3
                C3_degree = degrees[nodes] #Figuring out cildren's degrees
                Q[nodes] = C3_degre #Adding children to queue
                println("Q = ", "", Q)
            end
          end
          delete!(Q, C2)
          println("Q = ", "", Q)
        end
    end
    return R
    println(R)
end

R = CM(adjacency, degrees)
println("Cuthill McKee Order =", " ", R)

"""The Reverse Cuthill-McKee algorithm"""
