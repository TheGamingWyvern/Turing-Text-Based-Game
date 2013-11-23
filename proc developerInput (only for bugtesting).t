proc developerInput (originalInput : string)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% getInput for developers %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    var command := 0
    var inputMatch := 0

    var itemSubjects : int := 0
    var entitySubjects : int := 0
    var directionSubjects : int := 0

    var requestedItem : ^Item := nil

    var requestedEntity : ^Entity := nil
    var requestedDirection : ^Direction := nil

    var requestedMob : ^Entity

    locate (maxrow, 1)
    View.Set ("nooffscreenonly")

    View.ClipSet (1, 1, maxx, 20)
    View.Set ("offscreenonly")
    View.ClipOff
  
    var input : string := Str.Trim (originalInput)
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
	if index (input, existingItems (i) -> getName ()) not= 0 and existingItems (i) -> getName () not= "" then

	    requestedItem := existingItems (i)

	    itemSubjects += 1
	    input := Str.Trim (input (length (existingItems (i) -> getName ()) + 1 .. length (input)))
	end if
    end for


    if index (input, player -> name) not= 0 then
	requestedEntity := player

	entitySubjects += 1
    end if

    for i : 1 .. upper (existingEntities)
	if index (input, existingEntities (i) -> name) not= 0 and existingEntities (i) -> name not= "" then
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
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% doCommand for developers %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if requestedEntity = nil then
	if requestedDirection = nil then
	    if requestedItem not= nil then
		case command of
		    label 3 :
			cheatInItem (requestedItem)
		end case
	    end if
	end if
    else     %requestedEntity not= nil
	if requestedDirection = nil then
	    if requestedItem not= nil then
	    else
		case command of
		    label 10 :
			spawnMob (requestedEntity)
		    label :
		end case
	    end if
	end if
    end if
end developerInput
