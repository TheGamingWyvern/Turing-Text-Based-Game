% This class is for any enemy (and the player) in the game. Contains armor slots, health, attack, etc.
class Entity
    inherit customClass
    import Shield, Weapon, Helmet, BodyArmor, LegArmor, FeetArmor,
	noWeapon, noShield, noHelmet, noBodyArmor, noLegArmor, noFeetArmor
    export var all
    var mainHand : ^Weapon := noWeapon
    var offHand : ^Shield := noShield
    var Head : ^Helmet := noHelmet
    var Torso : ^BodyArmor := noBodyArmor
    var Legs : ^LegArmor := noLegArmor
    var Feet : ^FeetArmor := noFeetArmor
    var minAttackValue, maxAttackValue : int := 0
    var minDefenseValue, maxDefenseValue : int := 0
    % The health values are the random minimum and meximum values for the starting health for a mob, while the
    % Mob healths are for the actualy random value generated.
    var minHealthValue, maxHealthValue : int := 0
    var currentMobHealth, maxMobHealth : int := 0
    
    proc ability ()
    end ability
end Entity