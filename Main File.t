import GUI %for proc initializeScreen

include "class CustomClass.t"
include "class Item.t"
include "class Consumable.t"
include "class Weapon.t"
include "class Helmet.t"
include "class BodyArmor.t"
include "class LegArmor.t"
include "class FeetArmor.t"
include "class Shield.t"
include "class Direction.t"

%Must be called before Entity but not before the main classes
include "initializeNoArmor.t"

include "class Entity.t"
include "class Room.t"

%Must be called AFTER Entity
include "initializePlayer.t"

include "proc initializeScreen.t"
initializeScreen ()

include "Public Variables.t"
include "Array Contents Initialization.t"
include "Mob Initialization and Noun Array.t"

include "fcn makeUppercase.t"

include "proc drawCharacter.t"
include "proc addText.t"
include "proc displayInventory.t"
include "proc displayGear.t"
include "proc customPut.t"
include "proc customGet.t"
include "proc noSecondInput.t"
include "proc shiftItems.t"
include "proc addItem.t"
include "proc dropItem.t"
include "proc inspectItem.t"
include "proc equipItems.t"
include "proc consumeItem.t"
include "proc look.t"
include "proc spawnMob.t"
include "proc damage.t"
include "proc attack.t"
include "proc randomGen.t"
include "proc movement.t"
include "proc simulate.t"
include "proc getInput.t"
include "proc doCommand.t"
include "proc runGame.t"
include "proc menu.t"

menu()
runGame ()
