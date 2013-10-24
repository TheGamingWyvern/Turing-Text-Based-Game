% for proc initializeScreen
import GUI

include "proc initializeScreen.t"
initializeScreen ()

forward proc customPut (userInput : string, continue : boolean)

include "class CustomClass.t"
include "class Item.t"
include "class Entity.t"
include "class Direction.t"
include "class Room.t"

include "initializePlayer.t"

include "proc ability.nothing.t"
include "Public Variables.t"

include "Array Contents Initialization.t"
include "Mob Initialization and Noun Array.t"

include "fcn makeUppercase.t"
include "proc drawCharacter.t"
include "proc addText.t"
include "proc displayInventory.t"
include "proc displayGear.t"
include "proc customGet.t"
include "proc customPut.t"
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
