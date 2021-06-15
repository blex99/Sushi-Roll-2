event_inherited();

frames_to_approach = room_speed;
alarm[11] = frames_to_approach;

// takes the old and new best times
var _old_time = level_get_best_time();
var _new_time;
level_update_best_time();
_new_time = level_get_best_time();

// remove the timer, as we will display the time ourself
instance_destroy(oTimer);

#region victory text set up
var _w = display_get_gui_width();
var _h = display_get_gui_height();
font = fnUI;
vertical_buffer = font_get_size(font);

xoffset_start = display_get_gui_width() / 2;
yoffset_start = 0;
xoffset = xoffset_start;
yoffset = yoffset_start;

arr = [];
array_push(arr, 
	"Level Complete!\n",
	"----------------",
	"Rice Collected: "		+ string(stats_get_num_rice()), 
	"Collectibles: "		+ "", // TODO display collectibles as pictures
	"Death Count: "			+ string(level_get_death_count()),
	"Best Time: "			+ string(mus2sec(_new_time))
);

if (stats_under_time_requirement())
	array_push(arr, "You're Fast!");

if (_old_time != _new_time)
	array_push(arr, "New Record!");

len = array_length(arr);
#endregion

#region buttons
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
#endregion