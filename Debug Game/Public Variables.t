% Public Variables New

% Item Types:
%  main hand
%  off hand
%  head
%  body
%  legs
%  feet

var tempText : string
var tempInt : int := 1
var textStorage : int

% noItem is for the error messages from the txt
var noItemSize : int := 0
var noItem : flexible array 1 .. noItemSize of string
var numCommands : int := 0
var commandArray : flexible array 1 .. numCommands, 1 .. 5 of string

var previousTextStart : int := 1
var previousTextEnd : int := maxrow - 6
var previousTextLocation : int
var previousText : array 1 .. (maxrow - 6) of string
for i : 1 .. (maxrow - 6)
    previousText (i) := ""
end for

var convert : string

var numDirections : int := 0
var existingDirections : flexible array 1 .. numDirections of ^Direction

var storedText : string := ""
var uninitBoolean : int := 16#FF

var BAG_SIZE : int := 10
var inventorySlots : flexible array 1 .. BAG_SIZE of ^Item

% Initializing all the inventory slots as nil.
for i : 1 .. BAG_SIZE
    new inventorySlots (i)
end for

var tempRoom : ^Room
new tempRoom

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

% Stores the rooms in tempRoom
roomCoord (x, y, z) := tempRoom

% The first room will always have doors in all directions, except for up and down
roomCoord (x, y, z) -> northDoor := true
roomCoord (x, y, z) -> eastDoor := true
roomCoord (x, y, z) -> southDoor := true
roomCoord (x, y, z) -> westDoor := true
roomCoord (x, y, z) -> upStair := true
roomCoord (x, y, z) -> downStair := false

var command := 0
var inputMatch := 0
var myRandint : int

var itemSubjects : int := 0
var entitySubjects : int := 0
var directionSubjects : int := 0

var requestedItem : ^Item := nil
var requestedEntity : ^Entity := nil
var requestedDirection : ^Direction := nil

var input : string := ""

var resY : int
resY := maxy

var existingItems : array 1 .. 17 of ^Item
var existingEntities : array 1 .. 4 of ^Entity

% syntax: existingEntities(index) -> create(name : string, minAtt, maxAtt, minDef, maxDef,
%   currentHP, maxHP, dodgeChance : int, ability : action proc)
new existingEntities(1)
existingEntities (1) -> create ("zombie", 3, 6, 3, 5, 10, 10, 1, mobNothing)

new existingEntities(2)
existingEntities (2) -> create ("skeleton", 5, 10, 4, 8, 15, 15, 1, mobNothing)

new existingEntities(3)
existingEntities (3) -> create ("goblin", 3, 5, 4, 7, 10, 10, 2, mobNothing)

new existingEntities(4)
existingEntities (4) -> create ("spider", 5, 10, 4, 6, 15, 15, 3, mobNothing)

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

