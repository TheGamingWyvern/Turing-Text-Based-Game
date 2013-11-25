%%%%%%%%%%%%%%%%%%%%%%%%%  ADD ITEMS  %%%%%%%%%%%%%%%%%%%%%%%%%
% Explanation
% All of this is related with adding items.
% When the inventory is full, it will tell you that, and not add any more items.
% The program will only add items in the next available slot.
proc addItem (itemToAdd : ^Item)
    if inventorySlots (10) -> getName () not= "" then
	customPut ("Your inventory is full.")
	return
    else
	for i : 1 .. upper (inventorySlots)
	    if inventorySlots (i) -> getName () = "" then
		inventorySlots (i) -> copy (itemToAdd)
		customPut ("You took the " + itemToAdd -> getName () + ".")
		itemToAdd -> reset
		shiftItems(roomCoord(x,y,z)->itemsInRoom)
		return
	    end if
	end for
    end if
end addItem
