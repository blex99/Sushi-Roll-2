event_inherited();

// get old best, new best, and current time completed
var _cur_time = timer_get_time();
var _old_best = level_get_best_time();
level_update_best_time();
var _new_best = level_get_best_time();

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
	"Your Time: "			+ string(mus2sec(_cur_time)),
	"Best Time: "			+ string(mus2sec(_new_best)),
);

// let player know how good they did
if (_old_best > _new_best)
	array_push(arr, "New Record!");
if (stats_time_goal_met())
	array_push(arr, "Time Goal met!");

len = array_length(arr);
#endregion

#region buttons
var _y;
var _num_buttons = 3; // update manually
_y = find_position_from_center(0, _num_buttons, sprite_get_height(oButton), _h * 0.5);
with (instance_create_depth(_w * 0.25, _y, -9999, oButton))
{
	btag = 0;
	dir = [-1, 2, -1, 1];
	my_script = game_level_room_reset;
	text = "Restart";
	array_push(other.buttons, self);
}

_y = find_position_from_center(1, _num_buttons, sprite_get_height(oButton), _h * 0.5);
with (instance_create_depth(_w * 0.25, _y, -9999, oButton))
{
	btag = 1;
	dir = [-1, 0, -1, 2];
	my_script = game_goto_menu_level;
	text = "Return to Level Select";
	array_push(other.buttons, self);
}

_y = find_position_from_center(2, _num_buttons, sprite_get_height(oButton), _h * 0.5);
with (instance_create_depth(_w * 0.25, _y, -9999, oButton))
{
	btag = 2;
	dir = [-1, 1, -1, 0];
	my_script = game_goto_next_level;
	text = "Go to Next Level";
	array_push(other.buttons, self);
}
#endregion