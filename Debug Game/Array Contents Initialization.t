open : textStorage, "arrayContents.txt", get

% Reads in all the random messages for when the user enters a blank or unrecognizable data in the game.
loop
    noItemSize += 1
    new noItem, noItemSize
    get : textStorage, tempText : *
    exit when tempText = "-----"
    noItem (noItemSize) := tempText
end loop

get : textStorage, tempText : *

% Reads in all the commands.
loop
    exit when tempText = "-----"
    numCommands += 1
    new commandArray, numCommands, upper (commandArray, 2)

    for j : 1 .. upper (commandArray, 2)

	if tempText = "" and j not= 1 then

	    for k : j .. upper (commandArray, 2)
		commandArray (numCommands, k) := ""
	    end for

	elsif tempText = "" and j = 1 then
	    get : textStorage, tempText : *
	elsif tempText = "-----" then

	    for k : j .. upper (commandArray, 2)
		commandArray (numCommands, k) := ""
	    end for

	    exit
	end if
	commandArray (numCommands, j) := tempText

	get : textStorage, tempText : *

    end for
end loop

%%%%%%%%%%%%%%%%%%%  READ IN ALL ITEMS  %%%%%%%%%%%%%%%%%%%%%%%%%

var tempDirection : ^Direction

%%%%%%%%%%%%%%%%%%%  READ IN ALL DIRECTIONS  %%%%%%%%%%%%%%%%%%%%%%%%%

loop
    new tempDirection
    get : textStorage, tempText : *
    exit when tempText = "-----"
    numDirections += 1
    new existingDirections, numDirections

    tempDirection -> name := tempText

    get : textStorage, tempText : *
    tempDirection -> userDirection := tempText

    existingDirections (numDirections) := tempDirection
end loop

close : textStorage
