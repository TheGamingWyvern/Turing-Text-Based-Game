proc runGame
    look
    customPut ("", false)

    loop
	getInput
	doCommand
	simulate
	customPut ("", false)
    end loop
end runGame
