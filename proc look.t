%%%%%%%%%%%%%%%%%%%%%%%%%  LOOK %%%%%%%%%%%%%%%%%%%%%%%%%
% Explanation
% This procedure lists all the items in a room, and all the exits.
% It displays everything in its own sentence (items in one, exits in another)
% If the item happens to start with a vowel, then it will plug in "an" instead of "a" so then
%  the grammar is correct.
% If the item happens to be plural (irom greaves, sticks) then the program will omit "an" and "a"
%  ("You see iron greaves here.", instead of, "You see a iron greaves here.")
proc look
    var numItemsInRoom : int := 0

    for i : 1 .. upper (roomCoord (x, y, z) -> itemsInRoom)
	if roomCoord (x, y, z) -> itemsInRoom (i) -> getName () not= "" then
	    numItemsInRoom += 1
	end if
    end for

    storeText ("You see")
    
    if numItemsInRoom not= 0 then
	for i : 1 .. numItemsInRoom
	    if i = numItemsInRoom and numItemsInRoom > 1 then
		storeText (" and")
	    end if

	    if roomCoord (x, y, z) -> itemsInRoom (i) -> getName () not= "" then
		case roomCoord (x, y, z) -> itemsInRoom (i) -> getName () (length (roomCoord (x, y, z) -> itemsInRoom (i) -> getName ())) of
		    label "s" :
			storeText (" " + roomCoord (x, y, z) -> itemsInRoom (i) -> getName ())
		    label :
			case roomCoord (x, y, z) -> itemsInRoom (i) -> getName () (1) of
			    label "a", "e", "i", "o", "u" :
				storeText (" an " + roomCoord (x, y, z) -> itemsInRoom (i) -> getName ())
			    label :
				storeText (" a " + roomCoord (x, y, z) -> itemsInRoom (i) -> getName ())
			end case
		end case
	    end if

	    if i = numItemsInRoom then
		customPut (" on the dirty floor.")
	    elsif numItemsInRoom > 1 then
		storeText (",")
	    end if
	end for
    else
	customPut (" nothing useful in this room.")
    end if

    bind var room to roomCoord (x, y, z)

    if room -> northDoor or room -> eastDoor or room -> southDoor or room -> westDoor then
	storeText ("There is a passage way to the ")

	if room -> northDoor then
	    storeText ("north")
	    if room -> eastDoor or room -> southDoor or room -> westDoor then
		storeText (", ")
	    end if
	end if
	if room -> eastDoor then
	    if room -> southDoor or room -> westDoor then
		storeText ("east, ")
	    elsif room -> northDoor then
		storeText ("and east")
	    else
		storeText ("east")
	    end if
	end if
	if room -> southDoor then
	    if room -> westDoor then
		storeText ("south, ")
	    elsif room -> northDoor or room -> eastDoor then
		storeText ("and south")
	    else
		storeText ("south")
	    end if
	end if
	if room -> westDoor then
	    if room -> northDoor or room -> southDoor or room -> eastDoor then
		storeText ("and west")
	    else
		storeText ("west")
	    end if
	end if
	customPut (" here.")
    end if

    if room -> upStair or room -> downStair then
	storeText ("You notice a passage leading ")

	if room -> upStair then
	    if room -> downStair then
		storeText ("up ")
	    else
		customPut ("up.")
	    end if
	end if

	if room -> downStair then
	    if room -> upStair then
		customPut ("and down.")
	    else
		customPut ("down.")
	    end if
	end if
    end if
end look
