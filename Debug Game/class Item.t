class Item
    export getName, getDesc, getItemType,
	getMinAtt, getMaxAtt, getMinDef,
	getMaxDef, getDodgeBonus, create, ability,
	copy

    var name, desc, itemType : string := ""
    var ability : proc a (target : string, usedItem : ^Item)

    var minAtt, maxAtt, minDef, maxDef, dodgeBonus : int := 0

    fcn getName () : string
	result name
    end getName

    fcn getDesc () : string
	result desc
    end getDesc

    fcn getItemType () : string
	result itemType
    end getItemType

    fcn getMinAtt () : int
	result minAtt
    end getMinAtt

    fcn getMaxAtt () : int
	result maxAtt
    end getMaxAtt

    fcn getMinDef () : int
	result minDef
    end getMinDef

    fcn getMaxDef () : int
	result maxDef
    end getMaxDef

    fcn getDodgeBonus () : int
	result dodgeBonus
    end getDodgeBonus

    proc create (name_ : string, desc_ : string, itemType_ : string,
	    minAtt_ : int, maxAtt_ : int, minDef_ : int, maxDef_ : int, dodgeBonus_ : int,
	    ability_ : proc a (target : string, usedItem : ^Item))

	name := name_
	desc := desc_
	itemType := itemType_
	minAtt := minAtt_
	maxAtt := maxAtt_
	minDef := minDef_
	maxDef := maxDef_
	dodgeBonus := dodgeBonus_
	ability := ability_
    end create

    proc copy (itemToCopy : ^Item)
	create (itemToCopy -> getName (), itemToCopy -> getDesc (), itemToCopy -> getItemType (),
	    itemToCopy -> getMinAtt (), itemToCopy -> getMaxAtt (), itemToCopy -> getMinDef (),
	    itemToCopy -> getMaxDef (), itemToCopy -> getDodgeBonus (), itemToCopy -> ability)
    end copy
end Item

