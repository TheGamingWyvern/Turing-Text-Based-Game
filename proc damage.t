%%%%%%%%%%%%%%%%%%%%%%%%%  DAMAGE  %%%%%%%%%%%%%%%%%%%%%%%%%
% Explanation
% Calculates the damage the player and/or other mob is receiving.
% Basically, the damage is reduced based on equipment and base stats.
proc damage (mobDealingDamage, mobReceivingDamage : ^Entity)
    var negatedDamage : int := Rand.Int (mobReceivingDamage -> minDef,
	mobReceivingDamage -> maxDef) + Rand.Int (mobReceivingDamage -> head -> getMinDef (),
	mobReceivingDamage -> head -> getMaxDef ()) + Rand.Int (mobReceivingDamage -> torso -> getMinDef (),
	mobReceivingDamage -> torso -> getMaxDef ()) + Rand.Int (mobReceivingDamage -> legs -> getMinDef (),
	mobReceivingDamage -> legs -> getMaxDef ()) + Rand.Int (mobReceivingDamage -> feet -> getMinDef (),
	mobReceivingDamage -> feet -> getMaxDef ()) + Rand.Int (mobReceivingDamage -> offHand -> getMinDef (),
	mobReceivingDamage -> offHand -> getMaxDef ())

    var attackDamage : int := Rand.Int (mobDealingDamage -> minAtt,
	mobDealingDamage -> maxAtt) + Rand.Int (mobDealingDamage -> mainHand -> getMinAtt (),
	mobDealingDamage -> mainHand -> getMaxAtt ())

    var damageDealt : int := attackDamage - negatedDamage

    if damageDealt <= 0 then
	damageDealt := 1
    end if

    mobReceivingDamage -> currentMobHealth -= damageDealt
    customPut ("The " + mobReceivingDamage -> name + " received " + intstr (damageDealt) + " damage!")

    if mobReceivingDamage -> currentMobHealth >= 1 then
	customPut ("The " + mobReceivingDamage -> name + " has " + intstr (mobReceivingDamage -> currentMobHealth) + " health left!")
    else
	return
    end if
end damage
