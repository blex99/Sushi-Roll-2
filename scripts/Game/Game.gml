// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function game_goto_next_level(){
	with (oGame)
	{
		level_index = (level_index + 1) % array_length(levels);
		room_goto(levels[level_index]);
	}
}
