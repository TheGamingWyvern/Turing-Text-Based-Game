proc storeText (userInput: string)
    storedText := storedText + userInput
	loop
	    exit when length (storedText) <= (maxcol * 2 div 3) - 1

	    for i : 0 .. length (storedText) - 1
		if storedText (length (storedText) - i) = " " and length (storedText) - i <= maxcol * 2 div 3 then
		    addText (storedText (1 .. length (storedText) - i))
		    storedText := storedText (length (storedText) - i + 1 .. length (storedText))
		    exit
		end if
	    end for
	end loop
end storeText
