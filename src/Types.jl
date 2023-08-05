


@enum Fruit rapple=1 gapple=2 pear=3 plum=4


mutable struct Game
    orchard::Vector{Fruit}
    ravenpos::Int
    turn::Int
    isOver::Bool
    playersWon::Bool
    dieResults::Vector{Int}
    strategy::Function
end

Game() = Game([plum, plum, plum, plum, 
               rapple, rapple, rapple, rapple, 
               gapple, gapple, gapple, gapple, 
               pear, pear, pear, pear],
               0, # raven's position
               0, # current turn
               false, # game over?
               false,
               Int[],
               pickMax) # have players won?
Game(fun::Function) = Game([plum, plum, plum, plum, 
rapple, rapple, rapple, rapple, 
gapple, gapple, gapple, gapple, 
pear, pear, pear, pear],
0, # raven's position
0, # current turn
false, # game over?
false,
Int[],
fun)