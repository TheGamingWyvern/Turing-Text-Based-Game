%%%%%%%%%%%%%%%%%%%%%%%%%  INSPECT ITEMS  %%%%%%%%%%%%%%%%%%%%%%%%%
% Explanation
% Looks through your inventory to see if you have the requested item (itemToInspect)
%  and then display its description.
% Like drop and add, if the item is not there, the program will tell you that you do not have it.
proc inspectItem (itemToInspect : ^Item)
    for i : 1 .. upper (inventorySlots)
	if inventorySlots (i) = itemToInspect then
	    tempText := makeUppercase (inventorySlots (i) -> name)
	    customPut (tempText + ": " + inventorySlots (i) -> description, false)
	    return
	end if
    end for

    customPut ("You do not have", true)

    for i : 1 .. upper (inventorySlots)
	case itemToInspect -> name (length (itemToInspect -> name)) of
	    label "s" :
		customPut (" " + itemToInspect -> name + " in your backpack.", true)
		return
	    label :
		case itemToInspect -> name (1) of
		    label "a", "e", "i", "o", "u" :
			customPut (" an " + itemToInspect -> name + " in your backpack.", true)
			return
		    label :
			customPut (" a " + itemToInspect -> name + " in your backpack.", true)
			return
		end case
	end case
	return
    end for
end inspectItem
