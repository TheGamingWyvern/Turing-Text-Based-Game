%%%%%%%%%%%%%%%%%%%%%%%%%  SIMULATE  %%%%%%%%%%%%%%%%%%%%%%%%%
% Explanation
% When the player does something, the mobs, and possibly other
%  environment objects will have their turn to attack, or move.
proc simulate
    for i : 1 .. upper (roomCoord (x, y, z) -> mobsInRoom)
	if roomCoord (x, y, z) -> mobsInRoom (i) -> name not= "" then
	    damage (roomCoord (x, y, z) -> mobsInRoom (i), player)
	end if
    end for
end simulate

