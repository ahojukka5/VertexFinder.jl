module VertexFinder

import Base: isempty

"""
    Queue{T}

Simple queue type, having several shortcomings but it's working in this case
well enough.
"""
mutable struct Queue{T}
    data :: T
    head :: Int
    tail :: Int
end

function Queue(T, n::Int)
    return Queue(zeros(T, n), 1, 1)
end

function isempty(q::Queue)
    return q.head == q.tail
end

function enqueue!(q::Queue, item)
    q.data[q.tail] = item
    q.tail += 1
    if q.tail > length(q.data)
        resize!(q.data, length(q.data)*2)
    end
end

function dequeue!(q::Queue)
    if isempty(q)
        error("Queue is empty.")
    end
    item = q.data[q.head]
    q.head += 1
    return item
end

"""
    find(G, v)

Find a better estimate of a pseudoperipheral vertex `w` of graph `G`, starting
from a vertex `v`. George-Liu algorithm is used to find pseudoperipheral vertex.
"""
function find(G, v)
    n = length(G)

    queue = Queue(Int, n)
    visited = zeros(Bool, n)
    dist = zeros(Int, n)

    enqueue!(queue, v)
    visited[v] = true

    n = 0
    while !isempty(queue)
        n += 1
        v = dequeue!(queue)
        adjacent_vertices = getindex(G, v)
        for w in adjacent_vertices
            visited[w] && continue
            visited[w] = true
            enqueue!(queue, w)
            dist[w] = dist[v] + 1
        end
    end

    maxdist = maximum(dist)
    mindeg = 2^32
    w = -1

    for i=1:n
        dist[i] != maxdist && continue
        deg = length(G[i])
        if deg < mindeg
            mindeg = deg
            w = i
        end
    end

    return w
end

end # module
