/// @description create buttons through code
event_inherited();

// override my_previous_room to prevent possibly doing to main menu after 
// pressing escape
my_previous_room = -1;

var _w_half = GUI_W / 2;
var _num_buttons = 3; // I must update this manually, unfortunately
var _buff = 64;
var _y = find_positions_from_center(_num_buttons, _buff, GUI_H / 2);

with (instance_create_depth(_w_half, _y[0], -9999, oButton))
{
	btag = 0;
	dir = [-1, 5, -1, 1];
	my_script = level_toggle_pause;
	text = "Resume";
	array_push(other.buttons, self);
}

with (instance_create_depth(_w_half, _y[1], -9999, oButton))
{
	btag = 1;
	dir = [-1, 0, -1, 2];
	my_script = sushi_die;
	text = "Restart";
	array_push(other.buttons, self);
}

with (instance_create_depth(_w_half, _y[2], -9999, oButton))
{
	btag = 2;
	dir = [-1, 1, -1, 0];
	my_script = game_goto_menu_level;
	text = "Return to Level Select";
	array_push(other.buttons, self);
}