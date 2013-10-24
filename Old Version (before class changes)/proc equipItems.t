%%%%%%%%%%%%%%%%%%%%%%%%%  EQUIP ITEMS  %%%%%%%%%%%%%%%%%%%%%%%%%
% Explanation
% Checks the requested item's item type (itemToEquip -> itemType) and makes sure that
%  the item you want to equip is indeed an equippable (chest piece, helmet).
% If the item is an equippable, then it is put in the respective slot.
% If the item is not an equippable, then you will be told that it is not an equippable, and that
%  it cannot be equipped.
proc equipItems (itemToEquip : ^Item)
    for i : 1 .. upper (inventorySlots)
	if itemToEquip = nothing then
	    noSecondInput
	    return
	elsif inventorySlots (i) = itemToEquip then
	    case itemToEquip -> itemType of
		label "weapon" :
		    if player -> mainHand not= noWeapon then
			inventorySlots (i) := player -> mainHand
		    else
			inventorySlots (i) := nothing
		    end if
		    player -> mainHand := itemToEquip
		label "shield" :
		    if player -> offHand not= noShield then
			inventorySlots (i) := player -> offHand
		    else
			inventorySlots (i) := nothing
		    end if
		    player -> offHand := itemToEquip
		label "helmet" :
		    if player -> Head not= noHelmet then
			inventorySlots (i) := player -> Head
		    else
			inventorySlots (i) := nothing
		    end if
		    player -> Head := itemToEquip
		label "torso" :
		    if player -> Torso not= noBodyArmor then
			inventorySlots (i) := player -> Torso
		    else
			inventorySlots (i) := nothing
		    end if
		    player -> Torso := itemToEquip
		label "legs" :
		    if player -> Legs not= noLegArmor then
			inventorySlots (i) := player -> Legs
		    else
			inventorySlots (i) := nothing
		    end if
		    player -> Legs := itemToEquip
		label "feet" :
		    if player -> Feet not= noFeetArmor then
			inventorySlots (i) := player -> Feet
		    else
			inventorySlots (i) := nothing
		    end if
		    player -> Feet := itemToEquip
		label :
		    customPut ("You cannot equip that.", false)
		    return
	    end case
	    shiftItems
	    customPut ("You have equipped " + itemToEquip -> name, false)
	    return
	end if
    end for
    customPut ("You do not have that.", false)
end equipItems
