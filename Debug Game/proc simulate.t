%%%%%%%%%%%%%%%%%%%%%%%%%  SIMULATE  %%%%%%%%%%%%%%%%%%%%%%%%%
% Explanation
% When the player does something, the mobs, and possibly other
%  environment objects will have their turn to attack, or move.
proc simulate
    for i : 1 .. upper (roomCoord (x, y, z) -> mobsInRoom)
	if roomCoord (x, y, z) -> mobsInRoom (i) -> name not= "" then
	    if roomCoord (x, y, z) -> mobsInRoom (i) -> turnsUntilAttack = 0 then
		damage (roomCoord (x, y, z) -> mobsInRoom (i), player)
	    else
		roomCoord (x, y, z) -> mobsInRoom (i) -> turnsUntilAttack -= 1
		customPut ("The mob cannot attack this turn.")
	    end if
	end if
    end for
end simulate

