% for proc initializeScreen
import GUI

include "proc initializeScreen.t"
initializeScreen ()

include "class Item.t"

forward proc customPut (userInput : string)
forward proc nothing (target : string, usedItem : ^Item)
forward proc heal (target : string, usedItem : ^Item)
forward proc poison (target : string, usedItem : ^Item)

include "class Entity.t"

forward proc mobNothing (target : ^Entity, caster : ^Entity)
forward proc mobPoison (target : ^Entity, caster : ^Entity)

include "class Direction.t"
include "class Room.t"

include "initializePlayer.t"

include "Public Variables.t"

include "proc ability.nothing.t"
include "proc ability.heal.t"
include "proc ability.poison.t"

include "proc ability.mobNothing.t"
include "proc ability.mobPoison.t"

include "fcn makeUppercase.t"
include "proc drawCharacter.t"
include "proc addText.t"
include "proc displayInventory.t"
include "proc displayGear.t"
include "proc customGet.t"
include "proc storeText.t"
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
include "proc doCommand.t"
include "proc getInput.t"
include "proc runGame.t"
include "proc menu.t"

menu ()
runGame ()
