open : textStorage, "mobs.txt", get

%%%%%%%%%%%%%%%%%%%  READ IN ALL MOBS  %%%%%%%%%%%%%%%%%%%%%%%%%
loop
    var tempEntity : ^Entity
    new tempEntity

    exit when eof (textStorage)

    numEntities += 1
    new existingEntities, numEntities

    loop
	get : textStorage, tempText : *

	exit when tempText = "-----"

	var locationOfColon : int := 0
	locationOfColon := index (tempText, ":")

	case tempText (1 .. locationOfColon - 1) of
	    label "name" :
		tempEntity -> name := tempText (locationOfColon + 1 .. *)
	    label "minimum attack" :
		tempEntity -> minAttackValue := strint (tempText (locationOfColon + 1 .. *))
	    label "maximum attack" :
		tempEntity -> maxAttackValue := strint (tempText (locationOfColon + 1 .. *))
	    label "minimum defense" :
		tempEntity -> minDefenseValue := strint (tempText (locationOfColon + 1 .. *))
	    label "maximum defense" :
		tempEntity -> maxDefenseValue := strint (tempText (locationOfColon + 1 .. *))
	    label "minimum health" :
		tempEntity -> minHealthValue := strint (tempText (locationOfColon + 1 .. *))
	    label "maximum health" :
		tempEntity -> maxHealthValue := strint (tempText (locationOfColon + 1 .. *))
	end case
    end loop
    existingEntities (numEntities) := tempEntity
end loop

close : textStorage

numNoun := numItems + numEntities + numDirections
new noun, numNoun

for i : 1 .. numNoun
    if i <= numItems then
	noun (i) := existingItems (i)
    elsif i > numItems and i <= numItems + numEntities then
	noun (i) := existingEntities (i - numItems)
    else
	noun (i) := existingDirections (i - (numItems + numEntities))
    end if
end for
