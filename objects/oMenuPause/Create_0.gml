/// @description create buttons through code

event_inherited();

// override my_previous_room to prevent possibly doing to main menu after 
// pressing escape
my_previous_room = -1;

var _w = display_get_gui_width();
var _h = display_get_gui_height();

var _button;
var i = 0;
var buff = 64;

_button = instance_create_depth(_w / 2, (i++ * buff) + (_h / 2), -9999, oButton);
_button.btag = 0;
_button.dir = [3, 1, -1, -1];
_button.my_script = level_toggle_pause;
_button.text = "Resume";
array_push(buttons, _button);

_button = instance_create_depth(_w / 2, (i++ * buff) + (_h / 2), -9999, oButton);
_button.btag = 1;
_button.dir = [0, 2, -1, -1];
_button.my_script = game_level_room_reset;
_button.text = "Restart";
array_push(buttons, _button);

_button = instance_create_depth(_w / 2, (i++ * buff) + (_h / 2), -9999, oButton);
_button.btag = 2;
_button.dir = [1, 3, -1, -1];
_button.my_script = toggle_fullscreen;
_button.text = "Fullscreen";
array_push(buttons, _button);

_button = instance_create_depth(_w / 2, (i++ * buff) + (_h / 2), -9999, oButton);
_button.btag = 3;
_button.dir = [2, 0, -1, -1];
_button.my_script = transition_start;
_button.my_script_args = [rMenuMain];
_button.text = "Main Menu";
array_push(buttons, _button);