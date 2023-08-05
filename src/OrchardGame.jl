module OrchardGame

# Write your package code here.
export Game,
    oneTurn!,
    finishGame!,
    oneSim

include("Types.jl")
include("gameFuns.jl")




end



# todo
"""
@time a = map(x -> oneSim(OrchardGame.pickMax), 1:100_000)
@time b = map(x -> oneSim(OrchardGame.pickMin), 1:100_000)
rPosA = map(x -> x.ravenpos, a)
rPosB = map(x -> x.ravenpos, b)
sum(rPosA .< 6)
sum(rPosB .< 6)
histogram(rPosA, alpha=0.5)
histogram!(rPosB, alpha=0.5)
"""