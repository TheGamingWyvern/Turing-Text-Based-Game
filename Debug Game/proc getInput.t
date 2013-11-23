proc getInput
    var command := 0
    var inputMatch := 0

    itemSubjects := 0
    entitySubjects := 0
    directionSubjects := 0

    requestedItemOwned := nil
    requestedItemInRoom := nil

    requestedEntity := nil
    requestedDirection := nil

    var requestedMob : ^Entity

    locate (maxrow, 1)
    View.Set ("nooffscreenonly")

    View.ClipSet (1, 1, maxx, 20)

    input := customGet ()

    View.Set ("offscreenonly")

    View.ClipOff

    customPut (input)

    % Searches the input to see if the command is valid,
    %  then sets the command category so the program knows what
    %  function or procedure to call.
    for i : 1 .. upper (commandArray, 1)
	exit when command not= 0
	for j : 1 .. upper (commandArray, 2)
	    if index (input, commandArray (i, j)) = 1 and commandArray (i, j) not= "" then
		command := i
		inputMatch := j
		input := Str.Trim (input (length (commandArray (i, j)) + 1 .. length (input)))
		exit
	    end if
	end for
    end for

    for i : 1 .. upper (inventorySlots)
	if index (input, inventorySlots (i) -> getName ()) not= 0 and inventorySlots (i) -> getName () not= "" then

	    requestedItemOwned := inventorySlots (i)

	    itemSubjects += 1
	    input := Str.Trim (input (length (inventorySlots (i) -> getName ()) + 1 .. length (input)))
	end if
    end for

    for i : 1 .. upper (roomCoord (x, y, z) -> itemsInRoom)
	if index (input, roomCoord (x, y, z) -> itemsInRoom (i) -> getName ()) not= 0 and roomCoord (x, y, z) -> itemsInRoom (i) -> getName () not= "" then

	    requestedItemInRoom := roomCoord (x, y, z) -> itemsInRoom (i)

	    itemSubjects += 1
	    input := Str.Trim (input (length (roomCoord (x, y, z) -> itemsInRoom (i) -> getName ()) + 1 .. length (input)))
	end if
    end for

    if index (input, player -> name) not= 0 then
	requestedEntity := player

	entitySubjects += 1
    end if

    for i : 1 .. upper (roomCoord (x, y, z) -> mobsInRoom)
	if index (input, roomCoord (x, y, y) -> mobsInRoom (i) -> name) not= 0 and roomCoord (x, y, z) -> mobsInRoom (i) -> name not= "" then

	    requestedEntity := roomCoord (x, y, z) -> mobsInRoom (i)

	    entitySubjects += 1
	    input := Str.Trim (input (length (roomCoord (x, y, z) -> mobsInRoom (i) -> name) + 1 .. length (input)))
	end if
    end for

    for i : 1 .. upper (existingDirections)
	if index (input, existingDirections (i) -> name) not= 0 then

	    requestedDirection := existingDirections (i)

	    directionSubjects += 1
	    input := Str.Trim (input (length (existingDirections (i) -> name) + 1 .. length (input)))
	end if
    end for

    doCommand (command, inputMatch)
end getInput
