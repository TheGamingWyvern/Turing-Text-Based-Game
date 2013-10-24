%%%%%%%%%%%%%%%%%%%%%%%%%  INSPECT ITEMS  %%%%%%%%%%%%%%%%%%%%%%%%%
% Explanation
% Looks through your inventory to see if you have the requested item (itemToInspect)
%  and then display its description.
% Like drop and add, if the item is not there, the program will tell you that you do not have it.
proc inspectItem (itemToInspect : ^Item)
    for i : 1 .. upper (inventorySlots)
	if inventorySlots (i) -> getName () = itemToInspect -> getName () then
	    tempText := makeUppercase (inventorySlots (i) -> getName ())
	    customPut (tempText + ": " + inventorySlots (i) -> getDesc (), false)
	    return
	end if
    end for

    customPut ("You do not have", true)

    for i : 1 .. upper (inventorySlots)
	case itemToInspect -> getName () (length (itemToInspect -> getName ())) of
	    label "s" :
		customPut (" " + itemToInspect -> getName () + " in your backpack.", false)
		return
	    label :
		case itemToInspect -> getName () (1) of
		    label "a", "e", "i", "o", "u" :
			customPut (" an " + itemToInspect -> getName () + " in your backpack.", false)
			return
		    label :
			customPut (" a " + itemToInspect -> getName () + " in your backpack.", false)
			return
		end case
	end case
	return
    end for
end inspectItem
