/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

msg = "~ Options ~";

var i = -2.5;
var buff = 48;
var _h = display_get_gui_height() * 0.5;
var _arr = 
[
	["+ Window Scale", 0, _h, 0, buff, game_set_window_scale, [true]],
	["- Window Scale", 0, _h, 0, buff, game_set_window_scale, [false]],
	["+ GUI Scale", 0, _h, 0, buff, game_set_gui_scale, [true]],
	["- GUI Scale", 0, _h, 0, buff, game_set_gui_scale, [false]],
	["Toggle Fullscreen", 0, _h, 0, buff, toggle_fullscreen],
	["Return", 0, _h, 0, buff, transition_start	, [rMainMenu]]
]
var _len = array_length(_arr);

for (var j = 0; j < _len; j++)
{
	var a = _arr[j];
	var _button;
	
	if (array_length(a) == 7)
		_button = button_create(a[0], a[1], a[2], a[3], a[4] * i, a[5], a[6]);
	else
		_button = button_create(a[0], a[1], a[2], a[3], a[4] * i, a[5]);
	
	ds_list_add(buttons, _button);
	
	i++;
}