%%%%%%%%%%%%%%%%%%%%%%%%%  ATTACK  %%%%%%%%%%%%%%%%%%%%%%%%%
proc attack (mobToAttack : ^Entity)
    for i : 1 .. upper (roomCoord (x, y, z) -> mobsInRoom)
	if roomCoord (x, y, z) -> mobsInRoom (i) = nil then
	elsif mobToAttack = roomCoord (x, y, z) -> mobsInRoom (i) then
	    damage (player, mobToAttack)
	    if mobToAttack -> currentMobHealth <= 0 then
		customPut ("You have killed the " + mobToAttack -> name + ".")
		roomCoord (x, y, z) -> mobsInRoom (i) := nil
	    end if
	    return
	end if
    end for
end attack
