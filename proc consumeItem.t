%%%%%%%%%%%%%%%%%%%%%%%%%  CONSUME ITEM  %%%%%%%%%%%%%%%%%%%%%%%%%
% Explanation
% Consumables are only directly linked with healing and/or damaging the player or mobs.
% Checks the item's type to make sure that it is a consumable.
% If it is a consumable, then it will add the defined health to the player's health value.
% If you cannot be healed any further, then you will be told the item had no effect.
% If the item is a poison or has a harmful effect, then the defined value will be deducted from your current health
%  and the proper message will be displayed (You lost X health).
proc consumeItem (itemToConsume : ^Item)
    for i : 1 .. upper (inventorySlots)
	if inventorySlots (i) = itemToConsume then
	    if itemToConsume -> itemType = "consumable" then
		var healthMod : int := Rand.Int (itemToConsume -> minAttr, itemToConsume -> maxAttr)

		player -> currentMobHealth += healthMod
		if player -> currentMobHealth > player -> maxMobHealth then
		    healthMod := healthMod - (player -> currentMobHealth - player -> maxMobHealth)
		    player -> currentMobHealth := player -> maxMobHealth
		end if

		dropItem (itemToConsume)
		tempText := intstr (abs (healthMod))
		if healthMod > 0 then

		    customPut ("You gained " + tempText + " health!", false)
		elsif healthMod < 0 then
		    customPut ("You lost " + tempText + " health!", false)
		else
		    customPut ("You already have full health!", false)
		end if
		return
	    else
		customPut ("You cannot consume a " + itemToConsume -> name, false)
		return
	    end if
	end if
    end for
    customPut ("You do not have a " + itemToConsume -> name + ".", false)
end consumeItem
