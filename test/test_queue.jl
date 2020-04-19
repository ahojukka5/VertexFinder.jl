using Test
using VertexFinder: Queue, enqueue!, dequeue!, isempty

q = Queue(Int, 1)
@test isempty(q) == true

enqueue!(q, 1)
enqueue!(q, 2)
@test isempty(q) == false

@test dequeue!(q) == 1
@test dequeue!(q) == 2
@test isempty(q) == true
