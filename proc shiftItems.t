%%%%%%%%%%%%%%%%%%%%%%%%%  SHIFT ITEMS  %%%%%%%%%%%%%%%%%%%%%%%%%
% Explanation
% Works like other programming languages's Array.Shift() function
% When items are removed from the begining of the inventory, they are
%  shifted up to make the inventory display look nice.
proc shiftItems (var arrayToShift : array 1 .. * of ^Item)
    for i : 1 .. upper (arrayToShift)
	if arrayToShift (i)->getName() = "" then
	    for j : i .. upper (arrayToShift)
		if j not= upper (arrayToShift) then
		    arrayToShift (j) := arrayToShift (j + 1)
		else
		    new arrayToShift (j)
		end if
	    end for
	end if
    end for
end shiftItems
