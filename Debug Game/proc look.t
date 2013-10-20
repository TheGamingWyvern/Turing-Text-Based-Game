%%%%%%%%%%%%%%%%%%%%%%%%%  LOOK %%%%%%%%%%%%%%%%%%%%%%%%%
% Explanation
% This procedure lists all the items in a room, and all the exits.
% It displays everything in its own sentence (items in one, exits in another)
% If the item happens to start with a vowel, then it will plug in "an" instead of "a" so then
%  the grammar is correct.
% If the item happens to be plural (irom greaves, sticks) then the program will omit "an" and "a"
%  ("You see iron greaves here.", instead of, "You see a iron greaves here.")
proc look
    customPut ("You see", true)
    for i : 1 .. (upper (existingItems))
	if i = upper (existingItems) then
	    customPut (" and", true)
	end if

	case existingItems (i) -> getName () (length (existingItems (i) -> getName())) of
	    label "s" :
		customPut (" " + existingItems (i) -> getName (), true)
	    label :
		case existingItems (i) -> getName () (1) of
		    label "a", "e", "i", "o", "u" :
			customPut (" an " + existingItems (i) -> getName (), true)
		    label :
			customPut (" a " + existingItems (i) -> getName (), true)
		end case
	end case

	if i = upper (existingItems) then
	    customPut (" on the dirty floor.", false)
	else
	    customPut (",", true)
	end if
    end for

    bind var room to roomCoord (x, y, z)

    if room -> northDoor or room -> eastDoor or room -> southDoor or room -> westDoor then
	customPut ("There is a passage way to the ", true)

	if room -> northDoor then
	    customPut ("north", true)
	    if room -> eastDoor or room -> southDoor or room -> westDoor then
		customPut (", ", true)
	    end if
	end if
	if room -> eastDoor then
	    if room -> southDoor or room -> westDoor then
		customPut ("east, ", true)
	    elsif room -> northDoor then
		customPut ("and east", true)
	    else
		customPut ("east", true)
	    end if
	end if
	if room -> southDoor then
	    if room -> westDoor then
		customPut ("south, ", true)
	    elsif room -> northDoor or room -> eastDoor then
		customPut ("and south", true)
	    else
		customPut ("south", true)
	    end if
	end if
	if room -> westDoor then
	    if room -> northDoor or room -> southDoor or room -> eastDoor then
		customPut ("and west", true)
	    else
		customPut ("west", true)
	    end if
	end if
	customPut (" here.", false)
    end if

    if room -> upStair or room -> downStair then
	customPut ("You notice a passage leading ", true)

	if room -> upStair then
	    if room -> downStair then
		customPut ("up ", true)
	    else
		customPut ("up.", false)
	    end if
	end if

	if room -> downStair then
	    if room -> upStair then
		customPut ("and down.", false)
	    else
		customPut ("down.", false)
	    end if
	end if
    end if
end look
