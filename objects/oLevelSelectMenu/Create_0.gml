/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

var i = -5;
var buff = 48;
var _h = display_get_gui_height() * 0.75;
var _arr = 
[
	["Level 1"	, 0, _h, 0, buff, game_goto_level, [0] ],
	["Level 2"	, 0, _h, 0, buff, game_goto_level, [1] ],
	["Level 3"	, 0, _h, 0, buff, game_goto_level, [2] ],
	["Level 4"	, 0, _h, 0, buff, game_goto_level, [3] ],
	["Level 5"	, 0, _h, 0, buff, game_goto_level, [4] ],
	["Level 6"	, 0, _h, 0, buff, game_goto_level, [5] ],
	["Level 7"	, 0, _h, 0, buff, game_goto_level, [6] ],
	["Level 8"	, 0, _h, 0, buff, game_goto_level, [7] ],
	["Level 9"	, 0, _h, 0, buff, game_goto_level, [8] ],
	["Level 10"	, 0, _h, 0, buff, game_goto_level, [9] ],
	["Main Menu", 0, _h, 0, buff, transition_start, [rMainMenu]	]
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