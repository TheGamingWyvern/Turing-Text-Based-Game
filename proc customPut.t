%%%%%%%%%%%%%%%%%%%%%%%%%  CUSTOM PUT  %%%%%%%%%%%%%%%%%%%%%%%%%
% Explanation
% This is where all the of the text display happens.
% It keeps the text in a certain border so the game's UI looks nice and doesn't clip
%  into the character drawing or inventory.
% This also makes the inventory display nicely, and the character, and the gear.
body proc customPut
	storeText (userInput)

	previousTextLocation := 5
	cls

	addText (storedText)
	storedText := ""

	if previousTextStart <= previousTextEnd then
	    for i : 1 .. (maxrow - 6)
		if previousText (i) not= "" then

		    for j : i .. (maxrow - 6)
			locate (5 + (j - i), 1)
			put previousText (j)
		    end for
		    exit
		end if
	    end for
	else
	    for i : previousTextStart .. upper (previousText)
		if previousText (i) not= "" then

		    for j : i .. upper (previousText)
			locate (previousTextLocation, 1)
			put previousText (j)
			previousTextLocation += 1
		    end for
		    exit
		end if
	    end for

	    for i : 1 .. previousTextEnd
		locate (previousTextLocation, 1)
		put previousText (i)
		previousTextLocation += 1
	    end for
	end if

	locate (2, 1)
	put "Health: ", player -> currentMobHealth, "/", player -> maxMobHealth
	locate (2, (maxcol * 2 div 3) - 29)
	put "Coordinates: (", x, ", ", y, ", ", z, ")"

	%Top Line
	Draw.ThickLine (1, maxy - 55, maxx * 2 div 3, maxy - 55, 3, red)
	%Vertical Line (on the right)
	Draw.ThickLine (maxx * 2 div 3, 30, maxx * 2 div 3, maxy, 3, red)
	%Bottom Line
	Draw.ThickLine (1, 30, maxx, 30, 3, red)

	displayInventory
	displayGear
	%drawCharacter
	View.Update
end customPut
