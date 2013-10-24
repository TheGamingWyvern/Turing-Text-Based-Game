proc getInput
    command := 0
    inputMatch := 0

    itemSubjects := 0
    entitySubjects := 0
    directionSubjects := 0

    requestedItem := nil
    requestedEntity := nil
    requestedDirection := nil

    randint (myRandint, 1, 16)

    var requestedMob : ^Entity

    locate (maxrow, 1)
    View.Set ("nooffscreenonly")

    View.ClipSet (1, 1, maxx, 20)

    input := customGet ()

    View.Set ("offscreenonly")

    View.ClipOff

    customPut (input, false)

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

    for i : 1 .. upper (existingItems)
	if index (input, existingItems (i) -> getName ()) not= 0 then

	    requestedItem := existingItems (i)

	    /*requestedItem -> create (existingItems (i) -> getName (), existingItems (i) -> getDesc (),
	     existingItems (i) -> getItemType (),
	     existingItems (i) -> getMinAtt (), existingItems (i) -> getMaxAtt (), existingItems (i) -> getMinDef (),
	     existingItems (i) -> getMaxDef (), existingItems (i) -> getDodgeBonus (), existingItems (i) -> ability)
	     */
	    itemSubjects += 1
	    input := Str.Trim (input (length (existingItems (i) -> getName ()) + 1 .. length (input)))
	end if
    end for

    if index (input, player -> name) not= 0 then
	requestedEntity := player
	entitySubjects+=1
    end if

    for i : 1 .. upper (existingEntities)
	if index (input, existingEntities (i) -> name) not= 0 then

	    requestedEntity := existingEntities (i)

	    entitySubjects += 1
	    input := Str.Trim (input (length (existingEntities (i) -> name) + 1 .. length (input)))
	end if
    end for

    for i : 1 .. upper (existingDirections)
	if index (input, existingDirections (i) -> name) not= 0 then

	    requestedDirection := existingDirections (i)

	    directionSubjects += 1
	    input := Str.Trim (input (length (existingDirections (i) -> name) + 1 .. length (input)))
	end if
    end for
end getInput
