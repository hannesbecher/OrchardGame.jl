

dieThrow() = rand(1:6)

function moveRaven!(g::Game)
    g.ravenpos += 1
end

isOver(g::Game) = g.isOver

"""
If the basket is rolled, a player can choose a fruit ad libitum. This function returns realises this. Returns an integer (position) of a fruit in the orchard. This uses the function in the `stategy` slot of the `Game` supplied.
"""
function basketPick(g::Game)
    return g.strategy(g)
end

function pickMax(g::Game)
    p1 = findall(x -> x == Fruit(1), g.orchard)
    p2 = findall(x -> x == Fruit(2), g.orchard)
    p3 = findall(x -> x == Fruit(3), g.orchard)
    p4 = findall(x -> x == Fruit(4), g.orchard)
    lens = map(x -> length(x), [p1, p2, p3, p4])
    chFruit = Fruit(argmax(lens))
    return findfirst(x -> x == chFruit, g.orchard)
end

function pickMin(g::Game)
    p1 = findall(x -> x == Fruit(1), g.orchard)
    p2 = findall(x -> x == Fruit(2), g.orchard)
    p3 = findall(x -> x == Fruit(3), g.orchard)
    p4 = findall(x -> x == Fruit(4), g.orchard)
    lens = map(x -> length(x), [p1, p2, p3, p4])
    lens[lens .== 0] .+=10
    chFruit = Fruit(argmin(lens))
    return findfirst(x -> x == chFruit, g.orchard)
end

function pickRand(g::Game)
    return rand(1:length(g.orchard))
end



function oneTurn!(g::Game)
    isOver(g) &&  return(g) # don't do anything


    g.turn += 1

    dt = dieThrow()
    push!(g.dieResults, dt)

    if dt == 6
        moveRaven!(g)
    elseif dt == 5
        # basket strategy
        popat!(g.orchard, basketPick(g))

    else
        pos = findall(x -> x == Fruit(dt), g.orchard) # returns empyt vector if fruit type not left
        length(pos) > 0 && popat!(g.orchard, pos[1])
    end

    # test if over and is so, set status
    if length(g.orchard) == 0
        g.isOver = true
    end


end

function finishGame!(g::Game)
    while !g.isOver
        oneTurn!(g)
    end

end

function oneSim(fun::Function=pickMax)
    a = Game(fun)
    finishGame!(a)
    return(a)
end