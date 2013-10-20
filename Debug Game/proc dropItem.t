%%%%%%%%%%%%%%%%%%%%%%%%%  DROP ITEMS  %%%%%%%%%%%%%%%%%%%%%%%%%
% Explanation
% This will look through your inventory for the requested item (itemToDrop) and will remove it
%  from your inventory and put it in the room.
% If you don't have the item you asked to drop, the program will tell you that you do not have it.
proc dropItem (itemToDrop : ^Item)
    if itemToDrop -> getName () = "" then
	noSecondInput
	return
    else
	for i : 1 .. 10
	    if inventorySlots (i) -> getName () = itemToDrop -> getName () then
		customPut ("You dropped the " + inventorySlots (i) -> getName (), false)
		free inventorySlots (i)
		new inventorySlots (i)
		shiftItems
		return
	    end if
	end for
    end if

    customPut ("You do not have", true)

    for i : 1 .. upper (inventorySlots)
	case itemToDrop -> getName () (length (itemToDrop -> getName ())) of
	    label "s" :
		customPut (" " + itemToDrop -> getName () + " in your backpack.", true)
		return
	    label :
		case itemToDrop -> getName () (1) of
		    label "a", "e", "i", "o", "u" :
			customPut (" an " + itemToDrop -> getName () + " in your backpack.", true)
			return
		    label :
			customPut (" a " + itemToDrop -> getName () + " in your backpack.", true)
			return
		end case
	end case
	return
    end for
end dropItem
