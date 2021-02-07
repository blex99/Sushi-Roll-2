/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

var buff = 48;
var _h = display_get_gui_height() * 0.75;
var _bw = button_get_width();
var _amount_of_levels = array_length(oGame.levels);

var _difficulty = 0; // 0 easy, 1 medium, 2 hard
var i_start = -5 / 2;
var i = i_start;

for (var j = 0; j < _amount_of_levels; j++)
{
	var _level_name = room_get_name(oGame.levels[j]);
	
	// display easy levels to the left
	// medium levels in the middle
	// and hard levels to the right
	var _x_offset = 0;
	switch (_difficulty)
	{
		case 0:
			_x_offset = _bw * -1;
			break;
		case 2:
			_x_offset = _bw;
			break;
	}
	
	var _button = button_create(_level_name, 0, _h, _x_offset, buff * i, game_goto_level, [j]);
	ds_list_add(buttons, _button);
	
	if (++i >= -1 * i_start)
	{
		i = i_start;
		_difficulty++;
	}
}

i = (-1 * i_start) + 1;
_button = button_create("Main Menu", 0, _h, 0, buff * i, transition_start, [rMainMenu]);
ds_list_add(buttons, _button);