%%%%%%%%%%%%%%%%%%%%%%%%%  MOVEMENT  %%%%%%%%%%%%%%%%%%%%%%%%%
% Explanation
% Checks in an array to see if the current directional command
%  is valid.
% If so, then the user's coordinates are changed respectively, and a room is
%  created when the user gets to a new coordinate.
proc movement (directionToMove : ^Direction)
    bind var currentDirection to directionToMove -> userDirection

    case currentDirection of
	label "n" :
	    if roomCoord (x, y, z) -> northDoor then
		if z + 1 <= upper (roomCoord, 3) then
		    z += 1
		end if
	    else
		customPut ("There is no exit " + directionToMove -> name + ".")
		return
	    end if
	label "s" :
	    if roomCoord (x, y, z) -> southDoor then
		if z - 1 >= lower (roomCoord, 3) then
		    z -= 1
		end if
	    else
		customPut ("There is no exit " + directionToMove -> name + ".")
		return
	    end if
	label "e" :
	    if roomCoord (x, y, z) -> eastDoor then
		if x + 1 <= upper (roomCoord, 1) then
		    x += 1
		end if
	    else
		customPut ("There is no exit " + directionToMove -> name + ".")
		return
	    end if
	label "w" :
	    if roomCoord (x, y, z) -> westDoor then
		if x - 1 >= lower (roomCoord, 1) then
		    x -= 1
		end if
	    else
		customPut ("There is no exit " + directionToMove -> name + ".")
		return
	    end if
	label "u" :
	    if roomCoord (x, y, z) -> upStair then
		if y + 1 <= upper (roomCoord, 2) then
		    y += 1
		end if
	    else
		customPut ("There is no exit " + directionToMove -> name + ".")
		return
	    end if
	label "d" :
	    if roomCoord (x, y, z) -> downStair then
		if y - 1 >= lower (roomCoord, 2) then
		    y -= 1
		end if
	    else
		customPut ("There is no exit " + directionToMove -> name + ".")
		return
	    end if
	label :
    end case
    randomGen
    randomGenItems
    customPut ("You moved " + directionToMove -> name + ".")
    look
end movement
