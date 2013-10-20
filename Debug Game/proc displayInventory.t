%%%%%%%%%%%%%%%%%%%%%%%%%  DISPLAY INVENTORY  %%%%%%%%%%%%%%%%%%%%%%%%%
% Explanation
% Displays all items in the inventory on the right side of the screen
%  that is seperate from the main game text box.
proc displayInventory
    locate ((maxrow - 33), (maxcol * 2 div 3 + 3))
    put "INVENTORY"

    for i : 1 .. upper (inventorySlots)
	convert := intstr (i)
	if inventorySlots (i) ->getName() = "" then
	    locate (i + (maxrow - 33), (maxcol * 2 div 3 + 3))
	    put convert + ": Empty"
	else
	    tempText := makeUppercase (inventorySlots (i) -> getName())
	    locate (i + (maxrow - 33), (maxcol * 2 div 3 + 3))
	    put convert + ": " + tempText
	end if
    end for
end displayInventory
