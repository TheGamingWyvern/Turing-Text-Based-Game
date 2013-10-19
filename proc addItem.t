%%%%%%%%%%%%%%%%%%%%%%%%%  ADD ITEMS  %%%%%%%%%%%%%%%%%%%%%%%%%
% Explanation
% All of this is related with adding items.
% When the inventory is full, it will tell you that, and not add any more items.
% The program will only add items in the next available slot.
proc addItem (itemToAdd : ^Item)
    if inventorySlots (10) not= nothing then
	customPut ("Your inventory is full.", false)
	return
    else
	for i : 1 .. upper (inventorySlots)
	    if inventorySlots (i) = nothing then
		inventorySlots (i) := itemToAdd
		customPut ("You took the " + itemToAdd -> name + ".", false)
		return
	    end if
	end for
    end if
    customPut ("There is no " + itemToAdd -> name + " here.", false)
end addItem
