% This class is for any enemy (and the player) in the game.
% Contains armor slots, health, attack, etc.
class Entity
    import Item
    export var all

    var name : string := ""
    var currentHP, maxHP : int := 0
    var mainHand, offHand, head, torso, legs, feet : ^Item
    var ability : proc a (target : ^Entity, caster : ^Entity)
    var dodgeBonus : int := 0

    new head
    new torso
    new legs
    new feet
    new mainHand
    new offHand

    var minAtt, maxAtt : int := 0
    var minDef, maxDef : int := 0

    var currentMobHealth, maxMobHealth : int := 0
    var turnsUntilAttack : int := 1

    proc reset

	name := ""

	minAtt := 0
	maxAtt := 0
	minDef := 0
	maxDef := 0

	currentHP := 0
	maxHP := 0

	free head
	new head

	free torso
	new torso

	free legs
	new legs

	free feet
	new feet

	free mainHand
	new mainHand

	free offHand
	new offHand

    end reset

    proc create (name_ : string, minAtt_, maxAtt_, minDef_, maxDef_,
	    currentHP_, maxHP_, dodgeBonus_ : int, ability_ : proc a (target : ^Entity, caster : ^Entity))

	name := name_
	minAtt := minAtt_
	maxAtt := maxAtt_
	minDef := minDef_
	maxDef := maxDef_
	currentHP:= currentHP_
	maxHP := maxHP_
	dodgeBonus := dodgeBonus_
	ability := ability_
    end create
end Entity
