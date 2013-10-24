%%%%%%%%%%%%%%%%%%%%%%%%%  DAMAGE  %%%%%%%%%%%%%%%%%%%%%%%%%
% Explanation
% Calculates the damage the player and/or other mob is receiving.
% Basically, the damage is reduced based on equipment and base stats.
proc damage (mobDealingDamage, mobReceivingDamage : ^Entity)
    var negatedDamage : int := Rand.Int (mobReceivingDamage -> minDefenseValue,
	mobReceivingDamage -> maxDefenseValue) + Rand.Int (mobReceivingDamage -> Head -> minAttr,
	mobReceivingDamage -> Head -> maxAttr) + Rand.Int (mobReceivingDamage -> Torso -> minAttr,
	mobReceivingDamage -> Torso -> maxAttr) + Rand.Int (mobReceivingDamage -> Legs -> minAttr,
	mobReceivingDamage -> Legs -> maxAttr) + Rand.Int (mobReceivingDamage -> Feet -> minAttr,
	mobReceivingDamage -> Feet -> maxAttr) + Rand.Int (mobReceivingDamage -> offHand -> minAttr,
	mobReceivingDamage -> offHand -> maxAttr)

    var attackDamage : int := Rand.Int (mobDealingDamage -> minAttackValue,
	mobDealingDamage -> maxAttackValue) + Rand.Int (mobDealingDamage -> mainHand -> minAttr,
	mobDealingDamage -> mainHand -> maxAttr)

    var damageDealt : int := attackDamage - negatedDamage

    if damageDealt <= 0 then
	damageDealt := 1
    end if

    mobReceivingDamage -> currentMobHealth -= damageDealt
    customPut ("The " + mobReceivingDamage -> name + " received " + intstr (damageDealt) + " damage!", false)

    if mobReceivingDamage -> currentMobHealth >= 1 then
	customPut ("The " + mobReceivingDamage -> name + " has " + intstr (mobReceivingDamage -> currentMobHealth) + " health left!", false)
    else
	return
    end if

    customPut ("", false)
end damage
