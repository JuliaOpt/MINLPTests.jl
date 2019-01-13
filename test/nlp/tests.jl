@testset "Nonconvex NLP Models" begin

@testset  "unit tests" begin
    include("001_010.jl")
    include("002_010.jl")

    include("003_010.jl")
    include("003_011.jl")
    include("003_012.jl")
    include("003_013.jl")
    include("003_014.jl")
    include("003_015.jl")
    include("003_016.jl")

    include("004_010.jl")
    include("004_011.jl")

    include("005_010.jl")
    #include("005_011.jl") # "Unrecognized function "\" used in nonlinear expression."
end

end