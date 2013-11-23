%%%%%%%%%%%%%%%%%%%%%%%%%  ATTACK  %%%%%%%%%%%%%%%%%%%%%%%%%
proc attack (mobToAttack : ^Entity)
    damage (player, mobToAttack)
    if mobToAttack -> currentMobHealth <= 0 then
	customPut ("You have killed the " + mobToAttack -> name + ".")
	mobToAttack -> reset
    end if
end attack
