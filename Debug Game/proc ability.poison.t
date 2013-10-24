body proc poison
    var targetEntity : ^Entity := nil

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
	customPut ("That target does not exist.", false)
    else
	targetEntity -> currentMobHealth -= value

	if targetEntity -> currentMobHealth < 0 then
	    customPut ("The " + targetEntity -> name + " has died.", false)
	    targetEntity := nil
	    return
	end if

	customPut ("You dealt the " + targetEntity -> name + " " + intstr(value) + " poison damage.", false)
	return
    end if
end poison
