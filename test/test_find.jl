using Test
using VertexFinder: find

#    5--7--6
#    |  | /
# 4--8--2
# |  |  |
# 9--1--3

G = Dict(
    1 => (3, 8, 9),
    2 => (3, 8, 7),
    3 => (1, 2),
    4 => (8, 9),
    5 => (7, 8),
    6 => (2, 7),
    7 => (5, 2, 6),
    8 => (1, 2, 4, 5),
    9 => (1, 4))

w1 = find(G, 1)
w2 = find(G, w1)
w3 = find(G, w2)
@test w1 == 6
@test w2 == 9
@test w3 == 6
