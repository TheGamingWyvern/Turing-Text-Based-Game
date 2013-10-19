class Item
    export getName, getDesc, getItemType,
	getMinAttr, getMaxAttr
    var name, description, itemType := ""

    % The values that are attributed to an entity (health from a potion, damage of a weapon, etc.)
    var minAttr, maxAttr : int := 0

    function getName () : string
	result name
    end getName

    function getDesc () : string
	result description
    end getDesc

    function getItemType () : string
	result itemType
    end getItemType

    function getMinAttr () : int
	result minAttr
    end getMinAttr

    function getMaxAttr () : int
	result maxAttr
    end getMaxAttr
end Item

