%%%%%%%%%%%%%%%%%%%%%%%%%  ADD ITEMS  %%%%%%%%%%%%%%%%%%%%%%%%%
% Explanation
% All of this is related with adding items.
% When the inventory is full, it will tell you that, and not add any more items.
% The program will only add items in the next available slot.
proc addItem (itemToAdd : ^Item)
    if inventorySlots (10) -> getName () not= "" then
	customPut ("Your inventory is full.", false)
	return
    else
	for i : 1 .. upper (inventorySlots)
	    if inventorySlots (i) -> getName () = "" then
		inventorySlots (i) -> create (itemToAdd -> getName (), itemToAdd -> getDesc (),
		    itemToAdd -> getItemType (),
		    itemToAdd -> getMinAtt (), itemToAdd -> getMaxAtt (), itemToAdd -> getMinDef (),
		    itemToAdd -> getMaxDef (), itemToAdd -> getDodgeBonus (), itemToAdd -> ability)
		customPut ("You took the " + itemToAdd -> getName () + ".", false)
		return
	    end if
	end for
    end if
    customPut ("There is no " + itemToAdd -> getName () + " here.", false)
end addItem
