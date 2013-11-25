%%%%%%%%%%%%%%%%%%%%%%%%%  DROP ITEMS  %%%%%%%%%%%%%%%%%%%%%%%%%
% Explanation
% This will look through your inventory for the requested item (itemToDrop) and will remove it
%  from your inventory and put it in the room.
% If you don't have the item you asked to drop, the program will tell you that you do not have it.
proc dropItem (itemToDrop : ^Item)
    if roomCoord (x, y, z) -> itemsInRoom (20) -> getName () not= "" then
	customPut ("There are too many things in this room. You feel like not adding to the mess by putting down something else to trip over.")
    else
	for i : 1 .. upper (roomCoord (x, y, z) -> itemsInRoom)
	    if roomCoord (x, y, z) -> itemsInRoom (i) -> getName () = "" then
		roomCoord (x, y, z) -> itemsInRoom (i) -> copy (itemToDrop)
		customPut ("You dropped the " + itemToDrop -> getName () + ".")
		itemToDrop -> reset
		shiftItems (inventorySlots)
		return
	    end if
	end for
    end if
end dropItem

