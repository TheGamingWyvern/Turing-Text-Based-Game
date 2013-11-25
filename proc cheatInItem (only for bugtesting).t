proc cheatInItem (itemToAdd : ^Item)
    if inventorySlots (10) -> getName () not= "" then
	customPut ("Your inventory is full.")
	return
    else
	for i : 1 .. upper (inventorySlots)
	    if inventorySlots (i) -> getName () = "" then
		inventorySlots (i) -> copy (itemToAdd)
		customPut ("You took the " + itemToAdd -> getName () + ".")
		return
	    end if
	end for
    end if
end cheatInItem
