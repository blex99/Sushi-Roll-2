/// @description create buttons through code

event_inherited();

// override my_previous_room to prevent possibly doing to main menu after 
// pressing escape
my_previous_room = -1;

var _w = display_get_gui_width();
var _h = display_get_gui_height();
var _num_buttons = 5; // I must update this manually, unfortunately
var _buff = 64;
var _ypos;
var i = 0;

_ypos = find_position_from_center(i++, _num_buttons, _buff, _h / 2);
with (instance_create_depth(_w / 2, _ypos, -9999, oButton))
{
	btag = 0;
	dir = [-1, 3, -1, 1];
	my_script = level_toggle_pause;
	text = "Resume";
	array_push(other.buttons, self);
}

_ypos = find_position_from_center(i++, _num_buttons, _buff, _h / 2);
with (instance_create_depth(_w / 2, _ypos, -9999, oButton))
{
	btag = 1;
	dir = [-1, 0, -1, 2];
	my_script = game_level_room_reset;
	text = "Restart";
	array_push(other.buttons, self);
}

_ypos = find_position_from_center(i++, _num_buttons, _buff, _h / 2);
with (instance_create_depth(_w / 2, _ypos, -9999, oButton))
{
	btag = 2;
	dir = [-1, 1, -1, 3];
	my_script = toggle_fullscreen;
	text = "Fullscreen";
	array_push(other.buttons, self);
}

_ypos = find_position_from_center(i++, _num_buttons, _buff, _h / 2);
with (instance_create_depth(_w / 2, _ypos, -9999, oButton))
{
	btag = 3;
	dir = [-1, 2, -1, 4];
	my_script = game_goto_menu_level;
	text = "Level Select";
	array_push(other.buttons, self);
}


_ypos = find_position_from_center(i++, _num_buttons, _buff, _h / 2);
with (instance_create_depth(_w / 2, _ypos, -9999, oButton))
{
	btag = 4;
	dir = [-1, 3, -1, 0];
	my_script = transition_start;
	my_script_args = [rMenuMain];
	text = "Main Menu";
	array_push(other.buttons, self);
}