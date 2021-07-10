event_inherited();

// get old best, new best, and current time completed
var _cur_time = timer_get_time();
var _old_best = level_get_best_time();
level_update_best_time();
var _new_best = level_get_best_time();
var _time_goal_met = stats_time_goal_met();

var _num_collected = 0;
if (level_is_orange_collected()) _num_collected++;
if (level_is_wasabi_collected()) _num_collected++;
all_collectibles = level_got_all_collectibles();

// remove the timer, as we will display the time ourself
instance_destroy(oTimer);

#region victory text set up
font = fnUI;
vertical_buffer = font_get_size(font) + 8;

// center positions of menu
start = Vector2(GUI_W * 1.5, GUI_H / 2);
target = Vector2(GUI_W * 0.75, GUI_H / 2);
cur = start;

arr = [];
array_push(arr, 
	"Level Complete!\n",
	"----------------",
	"Rice Collected: "	+ string(stats_get_num_rice()), 
	"Collectibles: "	+ string(_num_collected) + " / 2",
	"Death Count: "		+ string(level_get_death_count()),
	"Your Time: "		+ string(mus2sec(_cur_time)),
	"Best Time: "		+ string(mus2sec(_new_best)),
);

// let player know how good they did
if (_old_best > _new_best)
	array_push(arr, "New Record!");
if (_time_goal_met)
	array_push(arr, "Time Goal met!");

len = array_length(arr);
#endregion

#region buttons
var _num_buttons = 3; // update manually
var _y = find_positions_from_center(_num_buttons,
	sprite_get_height(sUIButton) + 16, GUI_H * 0.5);
var _w_quarter = GUI_W / 4;

with (instance_create_depth(_w_quarter, _y[0], -9999, oButton))
{
	btag = 0;
	dir = [-1, 2, -1, 1];
	my_script = game_goto_next_level;
	text = "Go to Next Level";
	array_push(other.buttons, self);
}

with (instance_create_depth(_w_quarter, _y[1], -9999, oButton))
{
	btag = 1;
	dir = [-1, 0, -1, 2];
	my_script = game_goto_room_reset;
	text = "Restart";
	array_push(other.buttons, self);
}

with (instance_create_depth(_w_quarter, _y[2], -9999, oButton))
{
	btag = 2;
	dir = [-1, 1, -1, 0];
	my_script = game_goto_menu_level;
	text = "Return to Level Select";
	array_push(other.buttons, self);
}
#endregion