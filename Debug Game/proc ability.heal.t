body proc heal
    var targetEntity : ^Entity := nil
    var value : int := Rand.Int (usedItem -> getMinAtt(), usedItem -> getMaxAtt())

    if target = "" then
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
	customPut ("That target does not exist.", false)
    else
	var differenceInHealth : int := targetEntity -> maxMobHealth - targetEntity -> currentMobHealth

	targetEntity -> currentMobHealth += value

	if targetEntity -> currentMobHealth > targetEntity -> maxMobHealth then
	    targetEntity -> currentMobHealth := targetEntity -> maxMobHealth
	    customPut ("You healed " + targetEntity -> name + " for " + intstr (differenceInHealth) + " health.", false)
	    return
	end if

	customPut ("You healed the " + targetEntity -> name + " for " + intstr (value) + " health.", false)
	return
    end if
end heal
