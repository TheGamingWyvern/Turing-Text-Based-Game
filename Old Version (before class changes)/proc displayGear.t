%%%%%%%%%%%%%%%%%%%%%%%%%  DISPLAY GEAR  %%%%%%%%%%%%%%%%%%%%%%%%%
% Explanation
% Displays all the gear that the player is wearing to the far right of the screen.
% Until changed by equipping an item, it will be displayed as 'Empty'.
proc displayGear
    locate (maxrow - 33, maxcol * 5 div 6 + 3)
    put "GEAR"
    locate (maxrow - 32, maxcol * 5 div 6 + 3)
    put "Head: " + makeUppercase (player -> Head -> name)
    locate (maxrow - 31, maxcol * 5 div 6 + 3)
    put "Torso: " + makeUppercase (player -> Torso -> name)
    locate (maxrow - 30, maxcol * 5 div 6 + 3)
    put "Legs: " + makeUppercase (player -> Legs -> name)
    locate (maxrow - 29, maxcol * 5 div 6 + 3)
    put "Feet: " + makeUppercase (player -> Feet -> name)
    locate (maxrow - 28, maxcol * 5 div 6 + 3)
    put "Main Hand: " + makeUppercase (player -> mainHand -> name)
    locate (maxrow - 27, maxcol * 5 div 6 + 3)
    put "Off-hand: " + makeUppercase (player -> offHand -> name)
end displayGear
