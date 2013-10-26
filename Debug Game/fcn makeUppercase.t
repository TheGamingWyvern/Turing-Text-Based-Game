%%%%%%%%%%%%%%%%%%%%%%%%%  UPPERCASE  %%%%%%%%%%%%%%%%%%%%%%%%%
% Explanation
% Takes a string and changes the first letter to the appropriate uppercase letter.
% Used when displaying description, inventory, and gear.
fcn makeUppercase (lowercaseString : string) : string
    if length (lowercaseString) = 0 then
	result lowercaseString
    else
	var uppercaseLetter : string
	var uppercaseString : string
	uppercaseLetter := chr (ord (lowercaseString (1)) - 32)
	uppercaseString := uppercaseLetter + lowercaseString (2 .. length (lowercaseString))
	result uppercaseString
    end if
end makeUppercase
