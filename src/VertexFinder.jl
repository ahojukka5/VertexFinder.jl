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

end # module
