%%%%%%%%%%%%%%%%%%%%%%%%%  DRAW CHARACTER  %%%%%%%%%%%%%%%%%%%%%%%%%
% Explanation
% Draws a thick stick-figure to the screen and changes colour
%  based on how hurt the player is. Character model will be disabled if resolution
% is too small.
proc drawCharacter
    var characterColour : int
    %if resY >= 1024 then
    if player -> currentMobHealth > 0 then
	characterColour := ceil ((player -> currentMobHealth div (player -> maxMobHealth div 8)) + 40)
	Draw.FillOval (maxx * 5 div 6, maxy * 11 div 12, (maxx div 38.4), (maxx div 38.4), characterColour)
	Draw.FillBox ((maxx * 5 div 6) - (maxx div 38.4), (maxy * 11 div 12) - (maxy div 30), (maxx * 5 div 6) + (maxx div 38.4), (maxy * 11 div 12) - (maxy div 6), characterColour)
	Draw.ThickLine ((maxx * 5 div 6) - (maxx div 38.4), (maxy * 11 div 12) - (maxy * 1000000 div (1200 * 1000000 div 65)), maxx * 9 div 12, (maxy * 11 div 12) - (maxy div 9.6), (maxy div 24),
	    characterColour)
	Draw.ThickLine ((maxx * 5 div 6) + (maxx div 38.4), (maxy * 11 div 12) - (maxy * 1000000 div (1200 * 1000000 div 65)), maxx * 11 div 12, (maxy * 11 div 12) - (maxy div 9.6), (maxy div 24),
	    characterColour)
	Draw.ThickLine ((maxx * 5 div 6) - (maxx div 76.8), (maxy * 11 div 12) - (maxy div 6), (maxx * 19 div 24) + (maxx div (1920 div 35)), (maxy * 11 div 12) - ((maxy * 1000000) div (1200 *
	    1000000 div 325)), (maxy div 24), characterColour)
	Draw.ThickLine ((maxx * 5 div 6) + (maxx div 76.8), (maxy * 11 div 12) - (maxy div 6), (maxx * 21 div 24) - (maxx div (1920 div 35)), (maxy * 11 div 12) - ((maxy * 1000000) div (1200 *
	    1000000 div 325)), (maxy div 24), characterColour)
    end if
    %elsif resY <= 1024 then
    % return
%end if
end drawCharacter