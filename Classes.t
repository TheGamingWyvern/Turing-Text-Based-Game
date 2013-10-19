
% This class allows "name" to be accessed in all classes in one for loop.
class customClass
    export var name
    var name : string := "empty"
end customClass

% This class is for each direction that the player can move (up, down, etc.)
class Direction
    inherit customClass
    export var userDirection
    var userDirection : string
end Direction

% This class is the parent for all the items that can go in your inventory.
class Item
    inherit customClass
    export var all
    var description : string := ""
    var itemType : string := ""
    var minAttr : int := 0
    var maxAttr : int := 0
end Item

% These classes hold all the different item types.
class Weapon
    inherit Item
    itemType := "weapon"
end Weapon

class Shield
    inherit Item
    itemType := "shield"
end Shield

class Helmet
    inherit Item
    itemType := "helmet"
end Helmet

class BodyArmor
    inherit Item
    itemType := "torso"
end BodyArmor

class LegArmor
    inherit Item
    itemType := "legs"
end LegArmor

class FeetArmor
    inherit Item
    itemType := "feet"
end FeetArmor

class Consumable
    inherit Item
    itemType := "consumable"
end Consumable

% These instances are to prevent the armor slots for the player from returning as uninitialized.
% To be replaced with nil
var noWeapon : ^Weapon
new noWeapon
var noShield : ^Shield
new noShield
var noHelmet : ^Helmet
new noHelmet
var noBodyArmor : ^BodyArmor
new noBodyArmor
var noLegArmor : ^LegArmor
new noLegArmor
var noFeetArmor : ^FeetArmor
new noFeetArmor

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
end Entity

var player : ^Entity
new player

% Initializes the player's base stats when he/she starts the game.
player -> name := "player"
player -> minAttackValue := 3
player -> maxAttackValue := 5
player -> minDefenseValue := 5
player -> maxDefenseValue := 5
player -> maxMobHealth := 50
player -> currentMobHealth := 50

% Explanation
% Class Room stores everything to do with the current room.
% The arrays store what can be in the room. So only 20 mobs, 20 items, and then a possible
%  20 room conditions.
class Room
    import Entity, Item
    export var all
    var numMobsInRoom, numItemsInRoom : int := 0
    var mobsInRoom : array 1 .. 20 of ^Entity
    var itemsInRoom : array 1 .. 20 of ^Item
    var environmentSettings : array 1 .. 20 of string
    var eastDoor, westDoor, northDoor, southDoor, upStair, downStair : boolean

    for i : 1 .. 20
	mobsInRoom (i) := nil
	itemsInRoom (i) := nil
	environmentSettings (i) := ""
    end for

end Room
