%%%%%%%%%%%%%%%%%%%%%%%%%  SPAWN MOBS (DEBUG!!!!!)  %%%%%%%%%%%%%%%%%%%%%%%%%
% Explanation
% DEBUG!!
% Spawns mobs at the player's request, and spawns it in the room the player is in.
% Only used for debug and to test gameplay balance
proc spawnMob (mobToSpawn : ^Entity)
    for i : 1 .. upper (existingEntities)
	if existingEntities (i) = mobToSpawn then
	    roomCoord (x, y, z) -> numMobsInRoom += 1
	    roomCoord (x, y, z) -> mobsInRoom (roomCoord (x, y, z) -> numMobsInRoom) := existingEntities (i)

	    roomCoord (x, y, z) -> mobsInRoom (roomCoord (x, y, z) -> numMobsInRoom) -> maxMobHealth := Rand.Int (roomCoord (x, y, z) ->
		mobsInRoom (roomCoord (x, y, z) ->
		numMobsInRoom) -> minHealthValue, roomCoord (x, y, z) -> mobsInRoom (roomCoord (x, y, z) ->
		numMobsInRoom) -> maxHealthValue)

	    roomCoord (x, y, z) -> mobsInRoom (roomCoord (x, y, z) -> numMobsInRoom) -> currentMobHealth :=
		roomCoord (x, y, z) -> mobsInRoom (roomCoord (x, y, z) -> numMobsInRoom) -> maxMobHealth

	    customPut ("You spawned the " + mobToSpawn -> name + ".", false)
	end if
    end for
end spawnMob
