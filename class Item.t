% This class is the parent for all the items that can go in your inventory.
class Item
    inherit customClass
    export var all
    var description : string := ""
    var itemType : string := ""
    var minAttr : int := 0
    var maxAttr : int := 0
end Item