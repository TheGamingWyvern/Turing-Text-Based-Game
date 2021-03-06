%%%%%%%%%%%%%%%%%%%%%%%%%  CONSUME ITEM  %%%%%%%%%%%%%%%%%%%%%%%%%
% Explanation
% Consumables are only directly linked with healing and/or damaging the player or mobs.
% Checks the item's type to make sure that it is a consumable.
% If it is a consumable, then it will add the defined health to the player's health value.
% If you cannot be healed any further, then you will be told the item had no effect.
% If the item is a poison or has a harmful effect, then the defined value will be deducted from your current health
%  and the proper message will be displayed (You lost X health).
proc consumeItem (itemToConsume : ^Item, targetEntity : ^Entity)
    if targetEntity = nil then
	itemToConsume -> ability ("", itemToConsume)
    else
	itemToConsume -> ability (targetEntity -> name, itemToConsume)
    end if

    customPut ("You have used the " + itemToConsume -> getName () + ".")

    if itemToConsume -> getItemType() = "consumable" then
	itemToConsume -> reset
    end if
end consumeItem
