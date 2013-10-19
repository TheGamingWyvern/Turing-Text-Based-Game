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

    for i : 1 .. upper (commandArray, 1)
	exit when command not= 0
	for j : 1 .. upper (commandArray, 2)
	    if index (input, commandArray (i, j)) = 1 and commandArray (i, j) not= "" then
		command := i
		inputMatch := j
		input := input (length (commandArray (i, j)) + 1 .. length (input))
		exit
	    end if
	end for
    end for
    % Explanation of 'i' for loop
    % Searches the input to see if the command is valid,
    %  then sets the command category so the program knows what
    %  function or procedure to call.

    for i : 1 .. upper (noun)
	if index (input, noun (i) -> name) not= 0 then
	    if objectclass (noun (i)) >= Item then
		requestedItem := noun (i)
		itemSubjects += 1
	    elsif objectclass (noun (i)) >= Entity then
		requestedEntity := noun (i)
		entitySubjects += 1
	    elsif objectclass (noun (i)) >= Direction then
		requestedDirection := noun (i)
		directionSubjects += 1
	    end if
	end if
    end for
end getInput
