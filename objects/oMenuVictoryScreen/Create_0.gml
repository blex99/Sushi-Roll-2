event_inherited();

var _w = display_get_gui_width();
var _h = display_get_gui_height();

font = fnUI;
vertical_buffer = font_get_size(font);

x = 0;
y = 0;

frames_to_approach = room_speed;
alarm[11] = frames_to_approach;

#region victory text set up
xoffset_start = display_get_gui_width() / 2;
yoffset_start = 0;
xoffset = xoffset_start;
yoffset = yoffset_start;

var _stats = stats_get_array();
arr = [];
array_push(arr, 
	"Level Complete!\n",
	"----------------",
	"Points\n",
	"Rice: "				+ _stats[0], 
	"Collectibles: "		+ _stats[1] );

if (stats_collected_everything())
	array_push(arr, "Collector Bonus: " + string(VALUE_COLLECTOR_BONUS));
if (stats_under_time_requirement())
	array_push(arr, "Speedy Bonus: " + string(VALUE_SPEEDY_BONUS));
	
array_push(arr,
	"Level Score Total: "	+ _stats[2],
	"-----------------\n");

len = array_length(arr);
#endregion

var _button;
var _xoffset = 16 + (256 / 2); // buffer + button_sprite_width / 2

_button = instance_create_depth(_w / 2 - _xoffset, _h * 0.8, -9999, oButton);
_button.btag = 0;
_button.dir = [1, -1, 1, -1];
_button.my_script = game_goto_menu_level;
_button.text = "Return to Level Select";
array_push(buttons, _button);

_button = instance_create_depth(_w / 2 + _xoffset, _h * 0.8, -9999, oButton);
_button.btag = 1;
_button.dir = [0, -1, 0, -1];
_button.my_script = game_goto_next_level;
_button.text = "Go to Next Level";
array_push(buttons, _button);