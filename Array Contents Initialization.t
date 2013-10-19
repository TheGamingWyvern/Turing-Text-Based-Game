open : textStorage, "arrayContents.txt", get

% Reads in all the random messages for when the user enters a blank or unrecognizable data in the game.
loop
    noItemSize += 1
    new noItem, noItemSize
    get : textStorage, tempText : *
    exit when tempText = "-----"
    noItem (noItemSize) := tempText
end loop

get : textStorage, tempText : *

% Reads in all the commands.
loop
    exit when tempText = "-----"
    numCommands += 1
    new commandArray, numCommands, upper (commandArray, 2)

    for j : 1 .. upper (commandArray, 2)

	if tempText = "" and j not= 1 then

	    for k : j .. upper (commandArray, 2)
		commandArray (numCommands, k) := ""
	    end for

	elsif tempText = "" and j = 1 then
	    get : textStorage, tempText : *
	elsif tempText = "-----" then

	    for k : j .. upper (commandArray, 2)
		commandArray (numCommands, k) := ""
	    end for

	    exit
	end if
	commandArray (numCommands, j) := tempText

	get : textStorage, tempText : *

    end for
end loop

%%%%%%%%%%%%%%%%%%%  READ IN ALL ITEMS  %%%%%%%%%%%%%%%%%%%%%%%%%
var tempItem : ^Item
var tempWeapon : ^Weapon
var tempShield : ^Shield
var tempHelmet : ^Helmet
var tempChestplate : ^BodyArmor
var tempLegs : ^LegArmor
var tempFeet : ^FeetArmor
var tempConsumable : ^Consumable

% Creates temp storage for everything.
new tempWeapon
new tempShield
new tempHelmet
new tempChestplate
new tempLegs
new tempFeet
new tempConsumable
tempItem := tempWeapon

loop
    get : textStorage, tempText : *
    if tempText = "-----" then
	case tempItem -> itemType of
	    label "weapon" :
		tempItem := tempShield
	    label "shield" :
		tempItem := tempHelmet
	    label "helmet" :
		tempItem := tempChestplate
	    label "torso" :
		tempItem := tempLegs
	    label "legs" :
		tempItem := tempFeet
	    label "feet" :
		tempItem := tempConsumable
	    label "consumable" :
		exit
	end case
	get : textStorage, tempText : *
    else
	case tempItem -> itemType of
	    label "weapon" :
		new tempWeapon
		tempItem := tempWeapon
	    label "shield" :
		new tempShield
		tempItem := tempShield
	    label "helmet" :
		new tempHelmet
		tempItem := tempHelmet
	    label "torso" :
		new tempChestplate
		tempItem := tempChestplate
	    label "legs" :
		new tempLegs
		tempItem := tempLegs
	    label "feet" :
		new tempFeet
		tempItem := tempFeet
	    label "consumable" :
		new tempConsumable
		tempItem := tempConsumable
	end case
    end if

    numItems += 1

    new existingItems, numItems

    tempItem -> name := tempText

    get : textStorage, tempText : *
    tempItem -> description := tempText

    get : textStorage, tempText : *
    tempInt := strint (tempText)
    tempItem -> minAttr := tempInt

    get : textStorage, tempText : *
    tempInt := strint (tempText)
    tempItem -> maxAttr := tempInt

    existingItems (numItems) := tempItem
end loop

var tempDirection : ^Direction

%%%%%%%%%%%%%%%%%%%  READ IN ALL DIRECTIONS  %%%%%%%%%%%%%%%%%%%%%%%%%

loop
    new tempDirection
    get : textStorage, tempText : *
    exit when tempText = "-----"
    numDirections += 1
    new existingDirections, numDirections

    tempDirection -> name := tempText

    get : textStorage, tempText : *
    tempDirection -> userDirection := tempText

    existingDirections (numDirections) := tempDirection
end loop

close : textStorage
