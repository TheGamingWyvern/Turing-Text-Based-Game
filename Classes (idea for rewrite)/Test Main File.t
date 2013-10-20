%Main File

include "Class Item.t"

proc nothing (target : ^Entity, value : int)
    put "hello"
end nothing

include "Public Variables.t"

put existingItems (1) -> getName ()
existingItems (1) -> ability (nil, 0)
