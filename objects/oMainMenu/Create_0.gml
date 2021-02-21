/// @description make buttons

event_inherited();

var i = 0.5;
var buff = 48;
var _h = display_get_gui_height() * 0.75;
var _arr = 
[
	["Start"		, 0, _h, 0, buff, run_start,						],
	["Level Select"	, 0, _h, 0, buff, transition_start, [rLevelSelect]	],
	["How to Play"	, 0, _h, 0, buff, transition_start, [rHowToPlay]	],
	["Options"		, 0, _h, 0, buff, transition_start, [rOptionsMenu]	],
	["Quit"			, 0, _h, 0, buff, game_end							]
];
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