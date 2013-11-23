%%%%%%%%%%%%%%%%%%%%%%%%%  INSPECT ITEMS  %%%%%%%%%%%%%%%%%%%%%%%%%
% Explanation
% Looks through your inventory to see if you have the requested item (itemToInspect)
%  and then display its description.
% Like drop and add, if the item is not there, the program will tell you that you do not have it.
proc inspectItem (itemToInspect : ^Item)
    customPut (makeUppercase (itemToInspect -> getName ()) + ": " + itemToInspect -> getDesc ())
    if itemToInspect -> getItemType () not= "consumable" then

	if itemToInspect -> getMinAtt () not= 0 and itemToInspect -> getMaxAtt () not= 0 then
	    customPut ("Damage: " + intstr (itemToInspect -> getMinAtt ()) + " to " + intstr (itemToInspect -> getMaxAtt ()))
	end if

	if itemToInspect -> getMinDef () not= 0 and itemToInspect -> getMaxDef () not= 0 then
	    customPut ("Defense: " + intstr (itemToInspect -> getMinDef ()) + " to " + intstr (itemToInspect -> getMaxDef ()))
	end if

	if itemToInspect -> getDodgeBonus () not= 0 then
	    customPut ("Dodge Bonus: " + intstr (itemToInspect -> getDodgeBonus ()) + "%")
	end if
    end if
end inspectItem
