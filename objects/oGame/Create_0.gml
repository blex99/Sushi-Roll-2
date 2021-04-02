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
levels[LEVEL_DIFF.BEGINNER] = 
[
	level_create("Starting Out", rLevelBeg01, 10),
	level_create("Upping the Pace", rLevelBeg02, 15),
	level_create("Counting Calories", rLevelBeg03, 20),
	level_create("Jumping Olympics: Bronze", rLevelBeg04, 5),
	level_create("Slippery Sliding Sashimi", rLevelBeg05, 20)
];

levels[LEVEL_DIFF.INTERMEDIATE] = 
[
	level_create("Octopus", rLevelInt01, 10),
	level_create("Spring Forward", rLevelInt02, 20),
	level_create("Ramps", rLevelInt03, 20),
	level_create("Big Knives", rLevelInt04, 15),
	level_create("Trapdoor Track Lesson", rLevelInt05, 12)
];

levels[LEVEL_DIFF.EXPERT] = 
[
	level_create("Up and Away", rLevelExp01, 35),
	level_create("Down You Go", rLevelExp02, 5),
	level_create("Slow and Steady", rLevelExp03, 45),
	level_create("A Hard Level", rLevelExp04, 20),
	level_create("Jumping Olympics: Silver", rLevelExp05, 12)
];
#endregion

diff_completed = array_create(LEVEL_DIFF.COUNT);
diff_unlocked = array_create(LEVEL_DIFF.COUNT);

// by default, only beginner is availible
for (var i = 1; i < LEVEL_DIFF.COUNT; i++)
	diff_unlocked[i] = false;
diff_unlocked[LEVEL_DIFF.BEGINNER] = true;

// by default, no difficilies have been completed
for (var i = 1; i < LEVEL_DIFF.COUNT; i++)
	diff_completed[i] = false;

// in the case that the player has save data, load it
if (!debug_mode || DEBUG_LOAD_DATA) my_game_load();

// unlock all levels, if desired
if (DEBUG_UNLOCK_ALL)
{
	for (var i = 0; i < LEVEL_DIFF.COUNT; i++)
	{
		diff_unlocked[i] = true;
		diff_completed[i] = true;
	}
}

// an array of rooms for difficulty select
menu_level_rooms = array_create(LEVEL_DIFF.COUNT);
menu_level_rooms[0] = rMenuLevelsBeginner;
menu_level_rooms[1] = rMenuLevelsIntermediate;
menu_level_rooms[2] = rMenuLevelsExpert;

draw_set_font(fnUI);
room_goto((debug_mode) ? DEBUG_START_ROOM : rSplashScreen);

