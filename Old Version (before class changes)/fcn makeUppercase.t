%%%%%%%%%%%%%%%%%%%%%%%%%  UPPERCASE  %%%%%%%%%%%%%%%%%%%%%%%%%
% Explanation
% Takes a string and changes the first letter to the appropriate uppercase letter.
% Used when displaying description, inventory, and gear.
fcn makeUppercase (lowercaseString : string) : string
    var uppercaseLetter : string
    var uppercaseString : string
    uppercaseLetter := chr (ord (lowercaseString (1)) - 32)
    uppercaseString := uppercaseLetter + lowercaseString (2 .. length (lowercaseString))
    result uppercaseString
end makeUppercase
