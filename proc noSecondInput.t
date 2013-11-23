%%%%%%%%%%%%%%%%%%%%%%%%%  NO INPUT SUBJECT  %%%%%%%%%%%%%%%%%%%%%%%%%
% Explanation
% Used when the user only types a command and does not enter a subject for the command.
proc noSecondInput (command, inputMatch : int)
    var currentMatch : string := commandArray (command, inputMatch)
    customPut (makeUppercase (currentMatch) + "...?")
end noSecondInput
