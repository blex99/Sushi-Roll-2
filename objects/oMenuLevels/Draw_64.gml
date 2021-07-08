/// @description draw selected level info

// print currently selected level's info
if ( alarm[1] != -1 || 
	(menu_cursor != noone && menu_cursor.object_index == oButtonBack) )
	exit;

var _str = "";

// the level struct you're hovering over
var _level = game_get_level(area, menu_cursor.btag);
var _level_sd = data_get_level_save_data(area, menu_cursor.btag);

with (oGame)
{
	var _num_collected = 0;
	if (_level_sd.collected_orange) _num_collected++;
	if (_level_sd.collected_wasabi) _num_collected++;

	// general level info
	_str += string(_level.level_name) + "\n";
	_str += "Time Goal: " + string(_level.time_sec_goal) + " seconds\n\n";

	// personal (saved) level info
	_str += "Collectibles: " + string(_num_collected) + " / 2\n";
	_str += "Deaths: " + string(_level_sd.death_counter) + "\n";
	_str += "Best Time: " + string(mus2sec(_level_sd.best_time_mus)) + " seconds\n";
	if (_level_sd.has_beaten) _str += "- BEATEN -\n";
}

set_draw(c_black, 1, fnUI, fa_center, fa_center);
draw_text_with_outline(GUI_W * 0.75, GUI_H / 2, _str);