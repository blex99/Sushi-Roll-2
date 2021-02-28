/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

msg = "~ Paused ~";

var i = 0.5;
var buff = 48;
var _h = display_get_gui_height() * 0.5;
var _arr = 
[
	["Resume"		, 0, _h, 0, buff, level_toggle_pause				],
	["Restart"		, 0, _h, 0, buff, transition_start	, [room]			],
	["Fullscreen"	, 0, _h, 0, buff, toggle_fullscreen					],
	["Main Menu"	, 0, _h, 0, buff, transition_start	, [rMenuMain]	]
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