%%%%%%%%%%%%%%%%%%%%%%%%%  SHIFT ITEMS  %%%%%%%%%%%%%%%%%%%%%%%%%
% Explanation
% Works like other programming languages's Array.Shift() function
% When items are removed from the begining of the inventory, they are
%  shifted up to make the inventory display look nice.
proc shiftItems
    for i : 1 .. upper (inventorySlots)
	if inventorySlots (i) = nothing then
	    for j : i .. upper (inventorySlots)
		if j not= upper (inventorySlots) then
		    inventorySlots (j) := inventorySlots (j + 1)
		else
		    inventorySlots (j) := nothing
		end if
	    end for
	end if
    end for
end shiftItems
