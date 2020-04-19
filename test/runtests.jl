using Test

@testset "Test VertexFinder.jl" begin
    @testset "Test Queue" begin include("test_queue.jl") end
    @testset "Test find" begin include("test_find.jl") end
end