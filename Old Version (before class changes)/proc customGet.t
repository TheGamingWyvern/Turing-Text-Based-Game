%%%%%%%%%%%%%%%%%%%%%%%%%  CUSTOM GET  %%%%%%%%%%%%%%%%%%%%%%%%%
% Explanation
% This is where all the of the input handling is.
% This function's sole purpose is to enable the quick-command feature with the up arrow key.
% It also makes all makes all capital letters lowercase.
function customGet () : string
    tempText := ""
    var inputKey : string (1)
    var numArrowKey : int := numInputs + 1

    loop
	getch (inputKey)
	if ord (inputKey) >= 65 and ord (inputKey) <= 90 then
	    inputKey := chr (ord (inputKey) + 32)
	    tempText := tempText + inputKey
	elsif (ord (inputKey) >= 97 and ord (inputKey) <= 122) or ord (inputKey) = 32 or (ord (inputKey) >= 48
		and ord (inputKey) <= 57) then
	    tempText := tempText + inputKey
	elsif ord (inputKey) = 10 then
	    exit
	elsif ord (inputKey) = 200 then
	    numArrowKey -= 1
	    if numArrowKey <= 0 then
		numArrowKey := 1
	    end if
	    tempText := previousInputs (numArrowKey)
	elsif ord (inputKey) = 208 then
	    numArrowKey += 1
	    if numArrowKey > numInputs then
		numArrowKey := numInputs
	    end if
	    tempText := previousInputs (numArrowKey)
	elsif ord (inputKey) = 8 then
	    if length (tempText) > 1 then
		tempText := tempText (1 .. length (tempText) - 1)
	    else
		tempText := ""
	    end if
	end if
	cls

	%Font.Draw (tempText, 0, 5, defFontID, brightgreen)
	%I changed this because it was placed awkwardly on my screen
	% just tell me how it looks on yours. 
	%If it's bad then change it back.
	Font.Draw (tempText, 0, 10, defFontID, brightgreen)
	View.Update
    end loop

    if tempText not= previousInputs (numInputs) then
	numInputs += 1
	new previousInputs, numInputs
	previousInputs (numInputs) := tempText
    end if

    result tempText
end customGet
