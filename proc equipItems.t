%%%%%%%%%%%%%%%%%%%%%%%%%  EQUIP ITEMS  %%%%%%%%%%%%%%%%%%%%%%%%%
% Explanation
% Checks the requested item's item type (itemToEquip -> itemType) and makes sure that
%  the item you want to equip is indeed an equippable (chest piece, helmet).
% If the item is an equippable, then it is put in the respective slot.
% If the item is not an equippable, then you will be told that it is not an equippable, and that
%  it cannot be equipped.
proc equipItems (itemToEquip : ^Item)
    var tempItem : ^Item
    new tempItem
    tempItem -> copy (itemToEquip)

    case itemToEquip -> getItemType () of
	label "main hand" :
	    if player -> mainHand -> getName () not= "" then
		itemToEquip -> copy (player -> mainHand)
	    else
		itemToEquip -> reset
	    end if
	    player -> mainHand -> copy (tempItem)

	label "off hand" :
	    if player -> offHand -> getName () not= "" then
		itemToEquip -> copy (player -> offHand)
	    else
		itemToEquip -> reset
	    end if
	    player -> offHand -> copy (tempItem)

	label "head" :
	    if player -> head -> getName () not= "" then
		itemToEquip -> copy (player -> head)
	    else
		itemToEquip -> reset
	    end if
	    player -> head -> copy (tempItem)

	label "body" :
	    if player -> torso -> getName () not= "" then
		itemToEquip -> copy (player -> torso)
	    else
		itemToEquip -> reset
	    end if
	    player -> torso -> copy (tempItem)

	label "legs" :
	    if player -> legs -> getName () not= "" then
		itemToEquip -> copy (player -> legs)
	    else
		itemToEquip -> reset
	    end if
	    player -> legs -> copy (tempItem)

	label "feet" :
	    if player -> feet -> getName () not= "" then
		itemToEquip -> copy (player -> feet)
	    else
		itemToEquip -> reset
	    end if
	    player -> feet -> copy (tempItem)

	label :
	    customPut ("You cannot equip that.")
	    free tempItem
	    return
    end case

    shiftItems (inventorySlots)
    customPut ("You have equipped the " + tempItem -> getName () + ".")
    free tempItem
    return
end equipItems
