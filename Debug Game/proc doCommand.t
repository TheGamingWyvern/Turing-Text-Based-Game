proc doCommand (command, inputMatch :int)
    if itemSubjects > 1 or entitySubjects > 1 or directionSubjects > 1 then
	customPut ("Too many subjects to satisfy the input command.", false)
    else
	if requestedItem not= nil and requestedEntity = nil and requestedDirection = nil then
	    case command of
		label 3 :
		    addItem (requestedItem)
		label 4 :
		    dropItem (requestedItem)
		label 5 :
		    inspectItem (requestedItem)
		label 7 :
		    consumeItem (requestedItem, requestedEntity)
		label 8 :
		    equipItems (requestedItem)
		label :
	    end case

	elsif requestedItem = nil and requestedEntity not= nil and requestedDirection = nil then
	    case command of
		label 10 :
		    spawnMob (requestedEntity)
		label 2 :
		    attack (requestedEntity)
		label :
	    end case

	elsif requestedDirection not= nil and requestedEntity = nil and requestedItem = nil then
	    case command of
		label 9 :
		    movement (requestedDirection)
		label :
	    end case

	elsif requestedItem = nil and requestedEntity = nil and requestedDirection = nil then
	    case command of
		label 1 :
		    customPut ("Some time passes...", false)
		label 6 :
		    look
		label 0 :
		    customPut (noItem (Rand.Int (1,16)), false)
		label :
		    noSecondInput (command, inputMatch)
	    end case

	elsif requestedItem not= nil and requestedEntity not= nil and requestedDirection = nil then
	    case command of
		label 7 :
		    consumeItem (requestedItem, requestedEntity)
		label :
	    end case
	else
	    customPut ("You cannot " + input, false)
	end if
    end if
end doCommand
