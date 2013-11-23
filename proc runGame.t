proc runGame
    look
    customPut ("")

    loop
	getInput
	simulate
	customPut ("")
    end loop
end runGame
