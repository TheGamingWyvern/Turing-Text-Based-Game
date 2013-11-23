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
	new mobsInRoom (i)
	new itemsInRoom (i)
	environmentSettings (i) := ""
    end for

end Room
