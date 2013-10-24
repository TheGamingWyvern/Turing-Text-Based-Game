%%%%%%%%%%%%%%%%%%%%%%%%%  EQUIP ITEMS  %%%%%%%%%%%%%%%%%%%%%%%%%
% Explanation
% Checks the requested item's item type (itemToEquip -> itemType) and makes sure that
%  the item you want to equip is indeed an equippable (chest piece, helmet).
% If the item is an equippable, then it is put in the respective slot.
% If the item is not an equippable, then you will be told that it is not an equippable, and that
%  it cannot be equipped.
proc equipItems (itemToEquip : ^Item)
    for i : 1 .. upper (inventorySlots)
	if itemToEquip -> getName () = "" then
	    noSecondInput
	    return
	elsif inventorySlots (i) -> getName () = itemToEquip -> getName () then
	    case itemToEquip -> getItemType () of
		label "main hand" :
		    if player -> mainHand not= nil then
			inventorySlots (i) := player -> mainHand
		    else
			free inventorySlots (i)
			new inventorySlots (i)
		    end if
		    new player -> mainHand
		    player -> mainHand -> create (itemToEquip -> getName (), itemToEquip -> getDesc (),
			itemToEquip -> getItemType (),
			itemToEquip -> getMinAtt (), itemToEquip -> getMaxAtt (), itemToEquip -> getMinDef (),
			itemToEquip -> getMaxDef (), itemToEquip -> getDodgeBonus (), itemToEquip -> ability)
		label "off hand" :
		    if player -> offHand not= nil then
			inventorySlots (i) := player -> offHand
		    else
			free inventorySlots (i)
			new inventorySlots (i)
		    end if
		    new player -> offHand
		    player -> offHand -> create (itemToEquip -> getName (), itemToEquip -> getDesc (),
			itemToEquip -> getItemType (),
			itemToEquip -> getMinAtt (), itemToEquip -> getMaxAtt (), itemToEquip -> getMinDef (),
			itemToEquip -> getMaxDef (), itemToEquip -> getDodgeBonus (), itemToEquip -> ability)
		label "head" :
		    if player -> head not= nil then
			inventorySlots (i) := player -> head
		    else
			free inventorySlots (i)
			new inventorySlots (i)
		    end if
		    new player -> head
		    player -> head -> create (itemToEquip -> getName (), itemToEquip -> getDesc (),
			itemToEquip -> getItemType (),
			itemToEquip -> getMinAtt (), itemToEquip -> getMaxAtt (), itemToEquip -> getMinDef (),
			itemToEquip -> getMaxDef (), itemToEquip -> getDodgeBonus (), itemToEquip -> ability)
		label "body" :
		    if player -> torso not= nil then
			inventorySlots (i) := player -> torso
		    else
			free inventorySlots (i)
			new inventorySlots (i)
		    end if
		    new player -> torso
		    player -> torso -> create (itemToEquip -> getName (), itemToEquip -> getDesc (),
			itemToEquip -> getItemType (),
			itemToEquip -> getMinAtt (), itemToEquip -> getMaxAtt (), itemToEquip -> getMinDef (),
			itemToEquip -> getMaxDef (), itemToEquip -> getDodgeBonus (), itemToEquip -> ability)
		label "legs" :
		    if player -> legs not= nil then
			inventorySlots (i) := player -> legs
		    else
			free inventorySlots (i)
			new inventorySlots (i)
		    end if
		    new player -> legs
		    player -> legs -> create (itemToEquip -> getName (), itemToEquip -> getDesc (),
			itemToEquip -> getItemType (),
			itemToEquip -> getMinAtt (), itemToEquip -> getMaxAtt (), itemToEquip -> getMinDef (),
			itemToEquip -> getMaxDef (), itemToEquip -> getDodgeBonus (), itemToEquip -> ability)
		label "feet" :
		    if player -> feet not= nil then
			inventorySlots (i) := player -> feet
		    else
			free inventorySlots (i)
			new inventorySlots (i)
		    end if
		    new player -> feet
		    player -> feet -> create (itemToEquip -> getName (), itemToEquip -> getDesc (),
			itemToEquip -> getItemType (),
			itemToEquip -> getMinAtt (), itemToEquip -> getMaxAtt (), itemToEquip -> getMinDef (),
			itemToEquip -> getMaxDef (), itemToEquip -> getDodgeBonus (), itemToEquip -> ability)
		label :
		    customPut ("You cannot equip that.", false)
		    return
	    end case
	    shiftItems
	    customPut ("You have equipped " + itemToEquip -> getName (), false)
	    return
	end if
    end for
    customPut ("You do not have that.", false)
end equipItems
