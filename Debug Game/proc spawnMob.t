%%%%%%%%%%%%%%%%%%%%%%%%%  SPAWN MOBS (DEBUG!!!!!)  %%%%%%%%%%%%%%%%%%%%%%%%%
% Explanation
% DEBUG!!
% Spawns mobs at the player's request, and spawns it in the room the player is in.
% Only used for debug and to test gameplay balance
proc spawnMob (mobToSpawn : ^Entity)
    for i : 1 .. upper (existingEntities)
	if existingEntities (i) = mobToSpawn then
	    bind var mob to existingEntities (i)

	    roomCoord (x, y, z) -> numMobsInRoom += 1

	    roomCoord (x, y, z) -> mobsInRoom (roomCoord (x, y, z) -> numMobsInRoom) ->
		create (mob -> name, mob -> minAtt, mob -> maxAtt, mob -> minDef, mob -> maxDef,
		mob -> currentHP, mob -> maxHP, mob -> dodgeBonus, mob -> ability)

	    customPut ("You spawned the " + mobToSpawn -> name + ".", false)
	end if
    end for
end spawnMob
