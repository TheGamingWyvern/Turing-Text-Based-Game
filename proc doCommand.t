proc doCommand (command, inputMatch : int, requestedItemOwned, requestedItemInRoom : ^Item, requestedEntity : ^Entity, requestedDirection : ^Direction)
    if requestedEntity = nil then
	if requestedDirection = nil then
	    if requestedItemOwned not= nil then
		%If you own the item and want to do something with it, put the call here.
		case command of
		    label 4 :
			dropItem (requestedItemOwned)
		    label 5 :
			inspectItem (requestedItemOwned)
		    label 7 :
			consumeItem (requestedItemOwned, requestedEntity)
		    label 8 :
			equipItems (requestedItemOwned)
		    label :
		end case

	    elsif requestedItemInRoom not= nil then
		%If the item is just on the ground, and you want to do something put the call here.
		case command of
		    label 3 :
			addItem (requestedItemInRoom)
		    label 5 :
			inspectItem (requestedItemInRoom)
		    label :
		end case

	    else     %Both items are nil
		case command of
		    label 1 :
			customPut ("Some time passes...")
		    label 6 :
			look
		    label 0 :
			customPut (noItem (Rand.Int (1, 16)))
		    label :
			noSecondInput (command, inputMatch)
		end case
	    end if

	else     %requestedDirection not= nil
	    if requestedItemOwned not= nil then
	    elsif requestedItemInRoom not= nil then
	    else
		case command of
		    label 9 :
			movement (requestedDirection)
		    label :
		end case
	    end if
	end if

    else     %requestedEntity not= nil
	if requestedDirection = nil then
	    if requestedItemOwned not= nil then
		case command of
		    label 7 :
			consumeItem (requestedItemOwned, requestedEntity)
		    label :
		end case

	    elsif requestedItemInRoom not= nil then
	    else
		case command of
		    label 2 :
			attack (requestedEntity)
		    label :
		end case
	    end if

	       /*else
	     if requestedItemOwned not= nil
	     elsif requestedItemInRoom not= nil
	     end if*/
	end if
    end if
end doCommand
