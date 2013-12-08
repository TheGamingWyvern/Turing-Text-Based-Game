%%%%%%%%%%%%%%%%%%%%%%%%%  DISPLAY GEAR  %%%%%%%%%%%%%%%%%%%%%%%%%
% Explanation
% Displays all the gear that the player is wearing to the far right of the screen.
% Until changed by equipping an item, it will be displayed as 'Empty'.
proc displayGear
    locate (maxrow - 70, maxcol * 5 div 6 + 3)
    put "GEAR"
    
    locate (maxrow - 69, maxcol * 5 div 6 + 3)
    if player -> head not= nil then
	put "Head: " + makeUppercase (player -> head -> getName ())
    else
	put "Head: "
    end if
    
    locate (maxrow - 68, maxcol * 5 div 6 + 3)
    if player -> torso not= nil then
	put "Torso: " + makeUppercase (player -> torso -> getName ())
    else
	put "Torso: "
    end if
    
    locate (maxrow - 67, maxcol * 5 div 6 + 3)
    if player -> legs not= nil then
	put "Legs: " + makeUppercase (player -> legs -> getName ())
    else
	put "Legs: "
    end if

    locate (maxrow - 66, maxcol * 5 div 6 + 3)
    if player -> feet not= nil then
	put "Feet: " + makeUppercase (player -> feet -> getName ())
    else
	put "Feet: "
    end if
    
    locate (maxrow - 65, maxcol * 5 div 6 + 3)
    if player -> mainHand not= nil then
	put "Main Hand: " + makeUppercase (player -> mainHand -> getName ())
    else
	put "Main Hand: "
    end if
    
    locate (maxrow - 64, maxcol * 5 div 6 + 3)
    if player -> offHand not= nil then
	put "Off-hand: " + makeUppercase (player -> offHand -> getName ())
    else
	put "Off-hand: "
    end if
end displayGear
