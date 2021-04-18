/// @description init resolution, levels array

#region init resolution
display_reset(0, false);
var _display_w = display_get_width();
var _display_h = display_get_height();

window_scale = 1;
gui_scale = 1;

// find the largest scale possible that will fit on the monitor dimensions
window_scale_max = 1;
while (_display_w >= BASE_W * window_scale_max &&
	   _display_h >= BASE_H * window_scale_max)
{
	window_scale_max++;
}
window_scale_max--;

if (START_FULLSCREEN) toggle_fullscreen();
game_resize_window();
display_set_gui_size(BASE_W , BASE_H);
#endregion

#region level array
diff_index = -1; // which difficulty are we currently on
level_index = -1; // which level in that difficulty are we currently on
level_first_try = true; // player hasn't died yet?
levels = [];
levels[LEVEL_TYPE.BEGINNER] = 
[
	level_create("Starting Out", rLevel_A01_L01, 10),
	level_create("Big Knives", rLevel_A01_L02, 15),
	level_create("Counting Calories", rLevel_A01_L03, 20),
	level_create("Jumping Olympics: Bronze", rLevel_A01_L04, 5),
	level_create("Slippery Sliding Sashimi", rLevel_A01_L05, 20)
];

levels[LEVEL_TYPE.INTERMEDIATE] = 
[
	level_create("Octopus", rLevel_A02_L01, 10),
	level_create("Spring Forward", rLevel_A02_L02, 20),
	level_create("Ramps", rLevel_A02_L03, 20),
	level_create("Upping the Pace", rLevel_A02_L04, 15),
	level_create("Trapdoor Track Lesson", rLevel_A02_L05, 12)
];

levels[LEVEL_TYPE.EXPERT] = 
[
	level_create("Up and Away", rLevel_A03_L01, 35),
	level_create("Down You Go", rLevel_A03_L02, 5),
	level_create("Slow and Steady", rLevel_A03_L03, 45),
	level_create("A Hard Level", rLevel_A03_L04, 20),
	level_create("Jumping Olympics: Silver", rLevel_A03_L05, 12)
];

levels[LEVEL_TYPE.MASTER] = 
[
	level_create("Intro to Gravity", rLevel_A04_L01, 35),
	level_create("Gravity 2", rLevel_A04_L02, 25),
	level_create("Gravity 3", rLevel_A04_L03, 25),
];
#endregion

diff_completed = array_create(LEVEL_TYPE.COUNT);
diff_unlocked = array_create(LEVEL_TYPE.COUNT);

// by default, only beginner is availible
for (var i = 1; i < LEVEL_TYPE.COUNT; i++)
	diff_unlocked[i] = false;
diff_unlocked[LEVEL_TYPE.BEGINNER] = true;

// by default, no level types have been completed
for (var i = 1; i < LEVEL_TYPE.COUNT; i++)
	diff_completed[i] = false;

// in the case that the player has save data, load it
if (!debug_mode || DEBUG_LOAD_DATA) my_game_load();

// unlock all levels, if desired
if (DEBUG_UNLOCK_ALL)
{
	for (var i = 0; i < LEVEL_TYPE.COUNT; i++)
	{
		diff_unlocked[i] = true;
		diff_completed[i] = true;
	}
}

// an array of rooms for difficulty select
menu_level_rooms = array_create(LEVEL_TYPE.COUNT);
menu_level_rooms[0] = rMenuArea01;
menu_level_rooms[1] = rMenuArea02;
menu_level_rooms[2] = rMenuArea03;
menu_level_rooms[3] = rMenuArea04;

draw_set_font(fnUI);
room_goto((debug_mode) ? DEBUG_START_ROOM : rMenuMain);

