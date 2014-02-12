% Public Variables New

% Item Types:
%  main hand
%  off hand
%  head
%  body
%  legs
%  feet

var storedText : string := ""

var BAG_SIZE : int := 10
var inventorySlots : flexible array 1 .. BAG_SIZE of ^Item

% Initializing all the inventory slots.
for i : 1 .. BAG_SIZE
    new inventorySlots (i)
end for

% By default, when the user presses the up arrow key, it will use the look command.
var numInputs : int := 1
var previousInputs : flexible array 1 .. numInputs of string
previousInputs (1) := "look"

% Sets the default room to 0, 0, 0
var x, y, z : int := 0

% The world is rendered as a rectangular prism and will be 80x40x80
var roomCoord : array - 40 .. 40, 0 .. 40, -40 .. 40 of ^Room

for i : lower (roomCoord, 1) .. upper (roomCoord, 1)
    for j : lower (roomCoord, 2) .. upper (roomCoord, 2)
	for k : lower (roomCoord, 3) .. upper (roomCoord, 3)
	    roomCoord (i, j, k) := nil
	end for
    end for
end for

% The first room will always have doors in all directions, except for down
new roomCoord (x, y, z)
roomCoord (x, y, z) -> northDoor := true
roomCoord (x, y, z) -> eastDoor := true
roomCoord (x, y, z) -> southDoor := true
roomCoord (x, y, z) -> westDoor := true
roomCoord (x, y, z) -> upStair := true
roomCoord (x, y, z) -> downStair := false

var input : string := ""

var previousTextStart : int := 1
var previousTextEnd : int := maxrow - 6
var previousTextLocation : int
var previousText : array 1 .. (maxrow - 6) of string
for i : 1 .. (maxrow - 6)
    previousText (i) := ""
end for

% noItem is for the error messages from the txt
var noItem : array 1 .. 16 of string
noItem (1) := "What?"
noItem (2) := "Let me think about it."
noItem (3) := "Let me get back to you."
noItem (4) := "Are you high?"
noItem (5) := "I do not understand."
noItem (6) := "..."
noItem (7) := "Let me get back to you on that."
noItem (8) := "Would you like some help?"
noItem (9) := "Huh?"
noItem (10) := "I'm confused."
noItem (11) := "Please. Take your time."
noItem (12) := "Maybe I should help you."
noItem (13) := "You're doing it wrong."
noItem (14) := "*sigh*"
noItem (15) := "Come on, you can do it!"
noItem (16) := "It's only your time you're wasting."

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

var commandArray : array 1 .. 10, 1 .. 5 of string
commandArray (1, 1) := "hold up"
commandArray (1, 2) := "sleep"
commandArray (1, 3) := "rest"
commandArray (1, 4) := "wait"
commandArray (1, 5) := ""

commandArray (2, 1) := "attack the"
commandArray (2, 2) := "kill"
commandArray (2, 3) := "hit"
commandArray (2, 4) := "attack"
commandArray (2, 5) := ""

commandArray (3, 1) := "take a"
commandArray (3, 2) := "take the"
commandArray (3, 3) := "pick up"
commandArray (3, 4) := "take"
commandArray (3, 5) := ""

commandArray (4, 1) := "drop the"
commandArray (4, 2) := "drop a"
commandArray (4, 3) := "put down"
commandArray (4, 4) := "remove"
commandArray (4, 5) := "drop"

commandArray (5, 1) := "look at the"
commandArray (5, 2) := "inspect the"
commandArray (5, 3) := "inspect"
commandArray (5, 4) := "examine"
commandArray (5, 5) := ""

commandArray (6, 1) := "look around"
commandArray (6, 2) := "look"
commandArray (6, 3) := ""
commandArray (6, 4) := ""
commandArray (6, 5) := ""

commandArray (7, 1) := "use a"
commandArray (7, 2) := "use the"
commandArray (7, 3) := "use"
commandArray (7, 4) := ""
commandArray (7, 5) := ""

commandArray (8, 1) := "put on the"
commandArray (8, 2) := "put on"
commandArray (8, 3) := "equip a"
commandArray (8, 4) := "equip the"
commandArray (8, 5) := "equip"

commandArray (9, 1) := "go"
commandArray (9, 2) := "move"
commandArray (9, 3) := "travel"
commandArray (9, 4) := "walk"
commandArray (9, 5) := "run"

commandArray (10, 1) := "spawn"
commandArray (10, 2) := ""
commandArray (10, 3) := ""
commandArray (10, 4) := ""
commandArray (10, 5) := ""

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

var existingDirections : flexible array 1 .. 10 of ^Direction
new existingDirections (1)
existingDirections (1) -> name := "north"
existingDirections (1) -> userDirection := "n"

new existingDirections (2)
existingDirections (2) -> name := "forward"
existingDirections (2) -> userDirection := "n"

new existingDirections (3)
existingDirections (3) -> name := "south"
existingDirections (3) -> userDirection := "s"
new existingDirections (4)
existingDirections (4) -> name := "back"
existingDirections (4) -> userDirection := "s"

new existingDirections (5)
existingDirections (5) -> name := "east"
existingDirections (5) -> userDirection := "e"

new existingDirections (6)
existingDirections (6) -> name := "right"
existingDirections (6) -> userDirection := "e"

new existingDirections (7)
existingDirections (7) -> name := "west"
existingDirections (7) -> userDirection := "w"

new existingDirections (8)
existingDirections (8) -> name := "left"
existingDirections (8) -> userDirection := "w"

new existingDirections (9)
existingDirections (9) -> name := "up"
existingDirections (9) -> userDirection := "u"

new existingDirections (10)
existingDirections (10) -> name := "down"
existingDirections (10) -> userDirection := "d"

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

var existingEntities : array 1 .. 7 of ^Entity
% syntax: existingEntities(index) -> create(string name, int minAtt, int maxAtt, int minDef, int maxDef,
%   int currentHP, int maxHP, int dodgeChance, proc ability)
new existingEntities (1)
existingEntities (1) -> create ("zombie", 4, 6, 3, 5, 10, 15, 1, mobNothing)

new existingEntities (2)
existingEntities (2) -> create ("skeleton", 6, 10, 4, 8, 10, 15, 1, mobNothing)

new existingEntities (3)
existingEntities (3) -> create ("goblin", 2, 6, 4, 6, 5, 10, 2, mobNothing)

new existingEntities (4)
existingEntities (4) -> create ("spider", 5, 10, 4, 6, 10, 12, 3, mobNothing)

new existingEntities (5)
existingEntities (5) -> create ("orc", 8, 10, 5, 8, 20, 20, 1, mobNothing)

new existingEntities (6)
existingEntities (6) -> create ("elemental", 10, 10, 4, 6, 8, 12, 1, mobNothing)

new existingEntities (7)
existingEntities (7) -> create ("spell caster", 10, 15, 4, 8, 10, 15, mobNothing)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

var existingItems : array 1 .. 3, 1 .. 8 of ^Item
% syntax: existingItems(index) -> create(string name, string desc, string type, int minAttack,
%   int maxAttack, int minDefense, int maxDefense, int dodgeChance, proc ability)
% In the case of consumables, attack values is the healing property, or actual attack property
% Example: Healing potion would have an attack value of, say, 10. It would heal the player 10 health.
new existingItems (1, 1)
existingItems (1, 1) -> create ("bronze sword", "A common shortsword that could be forged by any blacksmith.",
    "main hand", 2, 6, 0, 0, 0, nothing)

new existingItems (1, 2)
existingItems (1, 2) -> create ("bronze shield", "A medium sized heater shield.",
    "off hand", 0, 0, 4, 6, 0, nothing)

new existingItems (1, 3)
existingItems (1, 3) -> create ("bronze helm", "A bronze helmet.",
    "head", 0, 0, 1, 2, 0, nothing)

new existingItems (1, 4)
existingItems (1, 4) -> create ("bronze chestplate", "A bronze chestplate.",
    "body", 0, 0, 2, 4, 0, nothing)

new existingItems (1, 5)
existingItems (1, 5) -> create ("bronze leggings", "Bronze leggings.",
    "legs", 0, 0, 1, 2, 0, nothing)

new existingItems (1, 6)
existingItems (1, 6) -> create ("bronze boots", "Bronze boots.",
    "feet", 0, 0, 1, 2, 0, nothing)

new existingItems (1, 7)
existingItems (1, 7) -> create ("", "", "", 0, 0, 0, 0, 0, nothing)

new existingItems (1, 8)
existingItems (1, 8) -> create ("", "", "", 0, 0, 0, 0, 0, nothing)

new existingItems (2, 1)
existingItems (2, 1) -> create ("iron sword", "An iron sword.",
    "main hand", 4, 6, 0, 0, 0, nothing)

new existingItems (2, 2)
existingItems (2, 2) -> create ("iron shield", "An iron shield.",
    "off hand", 0, 0, 6, 8, 0, nothing)

new existingItems (2, 3)
existingItems (2, 3) -> create ("iron helmet", "A medium helmet that covers most of the face.",
    "head", 0, 0, 3, 3, 0, nothing)

new existingItems (2, 4)
existingItems (2, 4) -> create ("iron chestplate", "A small chestplate.",
    "body", 0, 0, 5, 5, 0, nothing)

new existingItems (2, 5)
existingItems (2, 5) -> create ("iron leggings", "Iron leg armour.",
    "legs", 0, 0, 2, 2, 0, nothing)

new existingItems (2, 6)
existingItems (2, 6) -> create ("iron boots", "I recommend you don't go swimming with these...",
    "feet", 0, 0, 2, 2, 0, nothing)

new existingItems (2, 7)
existingItems (2, 7) -> create ("potion of lesser healing", "A concotion of regenerative liquid stored in a small vial.",
    "consumable", 15, 15, 0, 0, 0, heal)

new existingItems (2, 8)
existingItems (2, 8) -> create ("", "", "", 0, 0, 0, 0, 0, nothing)

new existingItems (3, 1)
existingItems (3, 1) -> create ("steel sword", "A strong broadsword made of steel.",
    "main hand", 6, 11, 0, 0, 0, nothing)

new existingItems (3, 2)
existingItems (3, 2) -> create ("steel shield", "A large, rounded shield.",
    "off hand", 0, 0, 7, 10, 0, nothing)

new existingItems (3, 3)
existingItems (3, 3) -> create ("steel helmet", "A full helmet that covers the entire head.",
    "head", 0, 0, 6, 6, 0, nothing)

new existingItems (3, 4)
existingItems (3, 4) -> create ("steel chestplate", "\"This is a really heavy piece of armour!\"",
    "body", 0, 0, 10, 10, 0, nothing)

new existingItems (3, 5)
existingItems (3, 5) -> create ("steel greaves", "A strong piece of leg armour.",
    "legs", 0, 0, 5, 5, 0, nothing)

new existingItems (3, 6)
existingItems (3, 6) -> create ("steel boots", "\"These boots hardly fit my feet!\"",
    "feet", 0, 0, 5, 5, 0, nothing)

new existingItems (3, 7)
existingItems (3, 7) -> create ("potion of greater healing", "A concotion of regenerative liquid stored in a bottle.",
    "consumable", 25, 25, 0, 0, 0, heal)

new existingItems (3, 8)
existingItems (3, 8) -> create ("potion of poison", "A deadly brew of potion that will dispatch any man at a moments notice.",
    "consumable", 15, 15, 0, 0, 0, poison)

roomCoord (x, y, z) -> itemsInRoom (1) -> copy (existingItems (1, 1))
roomCoord (x, y, z) -> itemsInRoom (2) -> copy (existingItems (1, 2))
roomCoord (x, y, z) -> itemsInRoom (3) -> copy (existingItems (1, 3))
roomCoord (x, y, z) -> itemsInRoom (4) -> copy (existingItems (1, 4))
roomCoord (x, y, z) -> itemsInRoom (5) -> copy (existingItems (1, 5))
roomCoord (x, y, z) -> itemsInRoom (6) -> copy (existingItems (1, 6))

roomCoord (x, y, z) -> itemsInRoom (7) -> copy (existingItems (2, 1))
roomCoord (x, y, z) -> itemsInRoom (8) -> copy (existingItems (2, 2))
roomCoord (x, y, z) -> itemsInRoom (9) -> copy (existingItems (2, 3))
roomCoord (x, y, z) -> itemsInRoom (10) -> copy (existingItems (2, 4))
roomCoord (x, y, z) -> itemsInRoom (11) -> copy (existingItems (2, 5))
roomCoord (x, y, z) -> itemsInRoom (12) -> copy (existingItems (2, 6))
roomCoord (x, y, z) -> itemsInRoom (13) -> copy (existingItems (2, 7))

roomCoord (x, y, z) -> itemsInRoom (14) -> copy (existingItems (3, 1))
roomCoord (x, y, z) -> itemsInRoom (15) -> copy (existingItems (3, 2))
roomCoord (x, y, z) -> itemsInRoom (16) -> copy (existingItems (3, 3))
roomCoord (x, y, z) -> itemsInRoom (17) -> copy (existingItems (3, 4))
roomCoord (x, y, z) -> itemsInRoom (18) -> copy (existingItems (3, 5))
roomCoord (x, y, z) -> itemsInRoom (19) -> copy (existingItems (3, 6))
roomCoord (x, y, z) -> itemsInRoom (20) -> copy (existingItems (3, 7))

% Initializes the player's base stats when he/she starts the game.
var player : ^Entity
new player
player -> name := "player"
player -> minAtt := 3
player -> maxAtt := 5
player -> minDef := 5
player -> maxDef := 5
player -> maxMobHealth := 50
player -> currentMobHealth := 50
