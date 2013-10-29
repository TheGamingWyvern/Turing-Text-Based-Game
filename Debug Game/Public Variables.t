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

var itemSubjects : int := 0
var entitySubjects : int := 0
var directionSubjects : int := 0

var requestedItem : ^Item := nil
var requestedEntity : ^Entity := nil
var requestedDirection : ^Direction := nil

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
commandArray (5, 2) := "look"
commandArray (5, 3) := "inspect the"
commandArray (5, 4) := "examine"
commandArray (5, 5) := "inspect"

commandArray (6, 1) := "look around"
commandArray (6, 2) := "look"
commandArray (6, 3) := ""
commandArray (6, 4) := ""
commandArray (6, 5) := ""

commandArray (7, 1) := "use a"
commandArray (7, 2) := "use the"
commandArray (7, 3) := "consume a"
commandArray (7, 4) := "use"
commandArray (7, 5) := "consume"

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


var existingEntities : array 1 .. 4 of ^Entity

% syntax: existingEntities(index) -> create(name : string, minAtt, maxAtt, minDef, maxDef,
%   currentHP, maxHP, dodgeChance : int, ability : action proc)
new existingEntities (1)
existingEntities (1) -> create ("zombie", 3, 6, 3, 5, 10, 10, 1, mobNothing)

new existingEntities (2)
existingEntities (2) -> create ("skeleton", 5, 10, 4, 8, 15, 15, 1, mobNothing)

new existingEntities (3)
existingEntities (3) -> create ("goblin", 3, 5, 4, 7, 10, 10, 2, mobNothing)

new existingEntities (4)
existingEntities (4) -> create ("spider", 5, 10, 4, 6, 15, 15, 3, mobNothing)


var existingItems : array 1 .. 17 of ^Item

% syntax: existingItems(index) -> create(name : string, desc : string, type : string, minAttack : int,
%   maxAttack : int, minDefense : int, maxDefense : int, dodgeChance : int, ability : action proc)

% In the case of consumables, attack values is the healing property, or actual attack property
% Example: Healing potion would have an attack value of, say, 10. It would heal the player 10 health.
new existingItems (1)
existingItems (1) -> create ("sharp stick", "A medium sized sharpened stick.",
    "main hand", 2, 4, 0, 0, 0, nothing)

new existingItems (2)
existingItems (2) -> create ("bronze sword", "A common shortsword that could be forged by any blacksmith.",
    "main hand", 4, 6, 0, 0, 0, nothing)

new existingItems (3)
existingItems (3) -> create ("steel sword", "A strong broadsword made of steel.",
    "main hand", 6, 11, 0, 0, 0, nothing)

new existingItems (4)
existingItems (4) -> create ("wooden shield", "A weak shield made of wood.",
    "off hand", 0, 0, 3, 5, 0, nothing)

new existingItems (5)
existingItems (5) -> create ("bronze shield", "A medium sized heater shield.",
    "off hand", 0, 0, 4, 6, 0, nothing)

new existingItems (6)
existingItems (6) -> create ("steel shield", "A large, rounded shield.",
    "off hand", 0, 0, 7, 10, 0, nothing)

new existingItems (7)
existingItems (7) -> create ("iron helmet", "A medium helmet that covers most of the face.",
    "head", 0, 0, 3, 3, 0, nothing)

new existingItems (8)
existingItems (8) -> create ("steel helmet", "A full helmet that covers the entire head.",
    "head", 0, 0, 6, 6, 0, nothing)

new existingItems (9)
existingItems (9) -> create ("iron chestplate", "A small chestplate.",
    "body", 0, 0, 5, 5, 0, nothing)

new existingItems (10)
existingItems (10) -> create ("steel chestplate", "\"This is a really heavy piece of armour!\"",
    "body", 0, 0, 10, 10, 0, nothing)

new existingItems (11)
existingItems (11) -> create ("iron leggings", "A weak piece of leg armour.",
    "legs", 0, 0, 2, 2, 0, nothing)

new existingItems (12)
existingItems (12) -> create ("steel greaves", "A strong piece of leg armour.",
    "legs", 0, 0, 5, 5, 0, nothing)

new existingItems (13)
existingItems (13) -> create ("iron boots", "I recommend you don't go swimming with these...",
    "feet", 0, 0, 2, 2, 0, nothing)

new existingItems (14)
existingItems (14) -> create ("steel boots", "\"These boots hardly fit my feet!\"",
    "feet", 0, 0, 5, 5, 0, nothing)

new existingItems (15)
existingItems (15) -> create ("potion of lesser healing", "A concotion of regenerative liquid stored in a small vial.",
    "consumable", 15, 15, 0, 0, 0, heal)

new existingItems (16)
existingItems (16) -> create ("potion of greater healing", "A concotion of regenerative liquid stored in a bottle.",
    "consumable", 25, 25, 0, 0, 0, heal)

new existingItems (17)
existingItems (17) -> create ("potion of poison", "A deadly brew of potion that will dispatch any man at a moments notice.",
    "consumable", 15, 15, 0, 0, 0, poison)

