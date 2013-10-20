%%%%%%%%%%%%%%%%%%%%%%%%%  ADD TEXT  %%%%%%%%%%%%%%%%%%%%%%%%%
proc addText (textToAdd : string)
    previousText (previousTextStart) := textToAdd
    previousTextStart += 1
    previousTextEnd += 1

    if previousTextStart > upper (previousText) then
	previousTextStart := 1
    end if

    if previousTextEnd > upper (previousText) then
	previousTextEnd := 1
    end if
end addText
