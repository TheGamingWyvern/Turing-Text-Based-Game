%%%%%%%%%%%%%%%%%%%%%%%%%  RANDOM GENERATION  %%%%%%%%%%%%%%%%%%%%%%%%%
proc randomGen
    if roomCoord (x, y, z) = nil then
	new tempRoom
	roomCoord (x, y, z) := tempRoom

	if Rand.Int (0, 1) = 0 then
	    roomCoord (x, y, z) -> northDoor := false
	else
	    roomCoord (x, y, z) -> northDoor := true
	end if

	if Rand.Int (0, 1) = 0 then
	    roomCoord (x, y, z) -> southDoor := false
	else
	    roomCoord (x, y, z) -> southDoor := true
	end if

	if Rand.Int (0, 1) = 0 then
	    roomCoord (x, y, z) -> eastDoor := false
	else
	    roomCoord (x, y, z) -> eastDoor := true
	end if

	if Rand.Int (0, 1) = 0 then
	    roomCoord (x, y, z) -> westDoor := false
	else
	    roomCoord (x, y, z) -> westDoor := true
	end if

	if Rand.Int (0, 25) = 0 then
	    roomCoord (x, y, z) -> upStair := true
	else
	    roomCoord (x, y, z) -> upStair := false
	end if

	if Rand.Int (0, 25) = 0 then
	    roomCoord (x, y, z) -> downStair := true
	else
	    roomCoord (x, y, z) -> downStair := false
	end if

	if x - 1 >= lower (roomCoord, 1) then
	    if roomCoord (x - 1, y, z) not= nil then
		if #roomCoord (x - 1, y, z) -> eastDoor not= uninitBoolean then
		    roomCoord (x, y, z) -> westDoor := roomCoord (x - 1, y, z) -> eastDoor
		end if
	    end if
	else
	    roomCoord (x, y, z) -> westDoor := false
	end if

	if x + 1 <= upper (roomCoord, 1) then
	    if roomCoord (x + 1, y, z) not= nil then
		if #roomCoord (x + 1, y, z) -> westDoor not= uninitBoolean then
		    roomCoord (x, y, z) -> eastDoor := roomCoord (x + 1, y, z) -> westDoor
		end if
	    end if
	else
	    roomCoord (x, y, z) -> eastDoor := false
	end if

	if y - 1 >= lower (roomCoord, 2) then
	    if roomCoord (x, y - 1, z) not= nil then
		if #roomCoord (x, y - 1, z) -> upStair not= uninitBoolean then
		    roomCoord (x, y, z) -> downStair := roomCoord (x, y - 1, z) -> upStair
		end if
	    end if
	else
	    roomCoord (x, y, z) -> downStair := false
	end if

	if y + 1 <= upper (roomCoord, 2) then
	    if roomCoord (x, y + 1, z) not= nil then
		if #roomCoord (x, y + 1, z) -> downStair not= uninitBoolean then
		    roomCoord (x, y, z) -> upStair := roomCoord (x, y + 1, z) -> downStair
		end if
	    end if
	else
	    roomCoord (x, y, z) -> upStair := false
	end if

	if z - 1 >= lower (roomCoord, 3) then
	    if roomCoord (x, y, z - 1) not= nil then
		if #roomCoord (x, y, z - 1) -> northDoor not= uninitBoolean then
		    roomCoord (x, y, z) -> southDoor := roomCoord (x, y, z - 1) -> northDoor
		end if
	    end if
	else
	    roomCoord (x, y, z) -> southDoor := false
	end if

	if z + 1 <= upper (roomCoord, 3) then
	    if roomCoord (x, y, z + 1) not= nil then
		if #roomCoord (x, y, z + 1) -> southDoor not= uninitBoolean then
		    roomCoord (x, y, z) -> northDoor := roomCoord (x, y, z + 1) -> southDoor
		end if
	    end if
	else
	    roomCoord (x, y, z) -> northDoor := false
	end if

    end if
end randomGen
