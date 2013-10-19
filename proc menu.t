proc menu
    var startGameButton : int
    startGameButton := GUI.CreateButtonFull (maxx div 2 - 100, maxy div 2, 200, "START GAME  [S]",
	GUI.Quit, 50, 's', true)

    loop
	exit when GUI.ProcessEvent
    end loop

    cls
end menu
