% This class is for any enemy (and the player) in the game. 
% Contains armor slots, health, attack, etc.
class Entity
    inherit customClass
    import Item
    export var all
    
    var mainHand, offHand, head, torso, legs, feet : ^Item := nil
    var minAttackValue, maxAttackValue : int := 0
    var minDefenseValue, maxDefenseValue : int := 0
    
    var minHealthValue, maxHealthValue : int := 0
    var currentMobHealth, maxMobHealth : int := 0
end Entity
