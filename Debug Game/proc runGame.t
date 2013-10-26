proc runGame
    look
    customPut ("", false)

    loop
	getInput
	simulate
	customPut ("", false)
    end loop
end runGame
