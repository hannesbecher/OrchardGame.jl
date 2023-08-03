


@enum Fruit rapple=1 gapple=2 pear=3 plum=4


mutable struct Game
    orchard::Vector{Fruit}
    ravenpos::Int
    turn::Int
    isOver::Bool
    playersWon::Bool
end

Game() = Game([plum, plum, plum, plum, 
               rapple, rapple, rapple, rapple, 
               gapple, gapple, gapple, gapple, 
               pear, pear, pear, pear],
               0, # ravne's position
               0, # current turn
               false, # game over?
               false) # have players won?