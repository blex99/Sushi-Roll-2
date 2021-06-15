event_inherited();

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
vertical_buffer = font_get_size(font) + 8;

// center positions of menu
start = Vector2(_w * 1.5, _h / 2);
target = Vector2(_w * 0.75, _h / 2);
cur = start;

arr = [];
array_push(arr, 
	"Level Complete!\n",
	"----------------",
	"Rice Collected: "		+ string(stats_get_num_rice()), 
	"Collectibles: "		+ "", // TODO display collectibles as pictures
	"Death Count: "			+ string(level_get_death_count()),
	"Your Time: "			+ string(mus2sec(_old_time)),
	"Best Time: "			+ string(mus2sec(_new_time)),
);

// let player know how good they did
if (_old_time != _new_time)
	array_push(arr, "New Record!"); // best
else if (stats_under_time_requirement())
	array_push(arr, "You're Fast!"); // good

len = array_length(arr);
#endregion

#region buttons
var _y;
_y = find_position_from_center(0, 2, sprite_get_height(oButton), _h * 0.5);
with (instance_create_depth(_w * 0.25, _y, -9999, oButton))
{
	btag = 0;
	dir = [1, -1, 1, -1];
	my_script = game_goto_menu_level;
	text = "Return to Level Select";
	array_push(other.buttons, self);
}

_y = find_position_from_center(1, 2, sprite_get_height(oButton), _h * 0.5);
with (instance_create_depth(_w * 0.25, _y, -9999, oButton))
{
	btag = 1;
	dir = [0, -1, 0, -1];
	my_script = game_goto_next_level;
	text = "Go to Next Level";
	array_push(other.buttons, self);
}
#endregion