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
n = 100_000
@time a = map(x -> oneSim(OrchardGame.pickMax), 1:n)
@time b = map(x -> oneSim(OrchardGame.pickMin), 1:n)
@time c = map(x -> oneSim(OrchardGame.pickRand), 1:n)
rPosA = map(x -> x.ravenpos, a)
rPosB = map(x -> x.ravenpos, b)
rPosC = map(x -> x.ravenpos, c)
map(x -> sum(x .< 6)/n, [rPosA, rPosB, rPosC])

using Plots
histogram(rPosA, alpha=0.5)
histogram!(rPosB, alpha=0.5)
histogram!(rPosC, alpha=0.5)

using StatsBase
fa = ecdf(rPosA)
fb = ecdf(rPosB)
fc = ecdf(rPosC)
plot(x->fa(x), 0, 10, label="Max")
plot!(x->fb(x), 0, 10, label="Min")
plot!(x->fc(x), 0, 10, label="rand")
"""