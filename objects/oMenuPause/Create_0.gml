/// @description create buttons through code

event_inherited();

msg = "~ Paused ~";

var _w = display_get_gui_width();
var _h = display_get_gui_height();

var _button;
var i = 0;
var buff = 64;

_button = instance_create_depth(_w / 2, (i++ * buff) + (_h / 2), -9999, oButton);
_button.my_script = level_toggle_pause;
_button.text = "Resume";
array_push(buttons, _button);

_button = instance_create_depth(_w / 2, (i++ * buff) + (_h / 2), -9999, oButton);
_button.my_script = transition_start;
_button.text = "Restart";
array_push(buttons, _button);

_button = instance_create_depth(_w / 2, (i++ * buff) + (_h / 2), -9999, oButton);
_button.my_script = toggle_fullscreen;
_button.text = "Fullscreen";
array_push(buttons, _button);

_button = instance_create_depth(_w / 2, (i++ * buff) + (_h / 2), -9999, oButton);
_button.my_script = transition_start;
_button.my_script_args = [rMenuMain];
_button.text = "Main Menu";
array_push(buttons, _button);