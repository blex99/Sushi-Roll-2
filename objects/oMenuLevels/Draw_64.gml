/// @description draw selected level info

// print currently selected level's info
if ( alarm[1] != -1 || 
	(menu_cursor != noone && menu_cursor.object_index == oButtonBack) )
	exit;

var _str = "";
with (oGame)
{
	// the level struct you're hovering over
	var _level = levels[other.area][other.menu_cursor.btag];
	
	var _num_collected = 0;
	if (_level.collected_orange) _num_collected++;
	if (_level.collected_wasabi) _num_collected++;

	// show if you've beaten the level before
	if (_level.has_beaten) _str += "*";
	_str += string(_level.level_name) + "\n";
	_str += "Collectibles: " + string(_num_collected) + " / 2\n";
	_str += "Deaths: " + string(_level.death_counter) + "\n";
	_str += "Time Goal: " + string(_level.time_sec_goal) + " seconds\n";
	_str += "Best Time: " + string(mus2sec(_level.best_time_mus)) + " seconds\n";
}

set_draw(c_black, 1, fnUI, fa_center, fa_center);
draw_text_with_outline(GUI_W * 0.75, GUI_H / 2, _str);