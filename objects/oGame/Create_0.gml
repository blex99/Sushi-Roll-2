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
	level_create("Starting Out", rLevelBeg01, sec2mus(90), 0, 10, false),
	level_create("Upping the Pace", rLevelBeg02, sec2mus(90), 0, 15, false),
	level_create("Counting Calories", rLevelBeg03, sec2mus(90), 0, 20, false),
	level_create("Jumping Olympics: Bronze", rLevelBeg04, sec2mus(90), 0, 5, false),
	level_create("Slippery Sliding Sashimi", rLevelBeg05, sec2mus(90), 0, 20, false)
];

levels[LEVEL_DIFF.INTERMEDIATE] = 
[
	level_create("Octopus", rLevelInt01, sec2mus(90), 0, 10, false),
	level_create("Spring Forward", rLevelInt02, sec2mus(90), 0, 20, false),
	level_create("Ramps", rLevelInt03, sec2mus(90), 0, 20, false),
	level_create("Big Knives", rLevelInt04, sec2mus(90), 0, 15, false),
	level_create("Trapdoor Track Lesson", rLevelInt05, sec2mus(90), 0, 12, false)
];

levels[LEVEL_DIFF.EXPERT] = 
[
	level_create("Up and Away", rLevelExp01, sec2mus(90), 0, 35, false),
	level_create("Down You Go", rLevelExp02, sec2mus(90), 0, 5, false),
	level_create("Slow and Steady", rLevelExp03, sec2mus(90), 0, 45, false),
	level_create("A Hard Level", rLevelExp04, sec2mus(90), 0, 20, false),
	level_create("Jumping Olympics: Silver", rLevelExp05, sec2mus(90), 0, 12, false)
];

#endregion

// an array of rooms for difficulty select
menu_level_rooms = array_create(LEVEL_DIFF.COUNT);
menu_level_rooms[0] = rMenuLevelsBeginner;
menu_level_rooms[1] = rMenuLevelsIntermediate;
menu_level_rooms[2] = rMenuLevelsExpert;

// by default, only beginner is availible
diff_unlocked = array_create(LEVEL_DIFF.COUNT);
for (var i = 1; i < LEVEL_DIFF.COUNT; i++)
	diff_unlocked[i] = false;
diff_unlocked[LEVEL_DIFF.BEGINNER] = true;

// by default, no difficilies have been completed
diff_completed = array_create(LEVEL_DIFF.COUNT);
for (var i = 1; i < LEVEL_DIFF.COUNT; i++)
	diff_completed[i] = false;

draw_set_font(fnUI);
room_goto((debug_mode) ? DEBUG_START_ROOM : rSplashScreen);

