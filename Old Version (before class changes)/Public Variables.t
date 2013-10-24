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

var numItems : int := 0
var existingItems : flexible array 1 .. numItems of ^Item

var numEntities : int := 0
var existingEntities : flexible array 1 .. numEntities of ^Entity

var numDirections : int := 0
var existingDirections : flexible array 1 .. numDirections of ^Direction

var storedText : string := ""
var uninitBoolean : int := 16#FF

% The noun array stores all possible subjects for a command (ex. Items, Entities, etc.) so they can be accessed
% in one for loop
var numNoun := 0
var noun : flexible array 1 .. numNoun of ^customClass

% This is a simple way to avoid having a nil pointer error in the Add/DropItem procedures.
var nothing : ^Item
new nothing

var BAG_SIZE : int := 10
var inventorySlots : flexible array 1 .. BAG_SIZE of ^Item

% Initializing all the inventory slots as nil.
for i : 1 .. BAG_SIZE
    inventorySlots (i) := nothing
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
