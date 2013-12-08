body proc poison
    var targetEntity : ^Entity := nil
    var value : int := Rand.Int (usedItem -> getMinAtt (), usedItem -> getMaxAtt ())

    if target = "" then
	for i : 1 .. upper (roomCoord (x, y, z) -> mobsInRoom)
	    if roomCoord (x, y, z) -> mobsInRoom (i) not= nil then
		targetEntity := roomCoord (x, y, z) -> mobsInRoom (i)
		exit
	    end if
	end for
    elsif target = player -> name then
	targetEntity := player
    else
	for i : 1 .. upper (roomCoord (x, y, z) -> mobsInRoom)
	    if roomCoord (x, y, z) -> mobsInRoom (i) -> name = target then
		targetEntity := roomCoord (x, y, z) -> mobsInRoom (i)
		exit
	    end if
	end for
    end if

    if targetEntity = nil then
	customPut ("That target does not exist.")
    else
	targetEntity -> currentMobHealth -= value

	if targetEntity -> currentMobHealth < 0 then
	    customPut ("The " + targetEntity -> name + " has died!")
	    targetEntity -> reset
	    return
	end if

	customPut ("You dealt the " + targetEntity -> name + " " + intstr (value) + " poison damage!")
	return
    end if
end poison
