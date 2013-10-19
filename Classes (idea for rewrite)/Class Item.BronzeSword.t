class BronzeSword
    inherit Item
    name := "bronze sword"
    description := "A common shortsword that could be forged by any blacksmith."
    itemType := "weapon"
    minAttr := 4
    maxAttr := 6
end BronzeSword

var bronzeSword : ^BronzeSword
