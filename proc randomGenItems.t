proc randomGenItems
    var itemsToSpawn : int := 21 - ceil (sqrt (Rand.Int (1, 21 ** 2)))

    for i : 1 .. itemsToSpawn
	var rarity : int := 4 - ceil (sqrt (Rand.Int (1, 3 ** 2)))
	var itemNum : int
	var maxItemsInRarity : int := upper (existingItems, 2)

	loop
	    itemNum := Rand.Int (1, maxItemsInRarity)
	    exit when existingItems (rarity, itemNum) -> getName () not= ""
	    maxItemsInRarity := itemNum - 1
	end loop

	roomCoord (x, y, z) -> itemsInRoom (i) -> copy (existingItems (rarity, itemNum))
    end for
end randomGenItems
