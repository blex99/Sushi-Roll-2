/// @description init resolution, levels array

#region init resolution
display_reset(0, true);
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
area_index = -1; // which difficulty are we currently on
level_index = -1; // which level in that difficulty are we currently on
level_first_try = true; // player hasn't died yet?
levels = [];
levels[LEVEL_AREA.BEGINNER] = 
[
	level_create("Starting Out", rLevel_StartingOut, 10),
	level_create("360", rLevel_360, 20),
	level_create("Sushi Olympics: Bronze", rLevel_SushiOlympicsBronze, 5),
	level_create("Slippery Sliding Sashimi", rLevel_SlipperySlidingSashimi, 20),
	level_create("Rampin' Up", rLevel_RampinUp, 20),
];

levels[LEVEL_AREA.INTERMEDIATE] = 
[
	level_create("Watch Out for Knives", rLevel_WatchOutForKnives, 15),
	level_create("Octopus", rLevel_Octopus, 10),
	level_create("Spring Forward", rLevel_SpringForward, 20),
	level_create("Right or Left?", rLevel_RightOrLeft, 15),
	level_create("Trapdoor Track Lesson", rLevel_TrapdoorTrackLesson, 12),
];

levels[LEVEL_AREA.EXPERT] = 
[
	level_create("Up and Away", rLevel_UpAndAway, 35),
	level_create("Down You Go", rLevel_DownYouGo, 5),
	level_create("Slow and Steady", rLevel_SlowAndSteady, 45),
	level_create("Knife Dance", rLevel_KnifeDance, 20),
	level_create("Sushi Olympics: Silver", rLevel_SushiOlympicsSilver, 12),
];

levels[LEVEL_AREA.MASTER] = 
[
	level_create("Intro to Gravity", rLevel_IntroToGravity, 35),
	level_create("Orientation", rLevel_Orientation, 25),
	level_create("Gravitational Maze", rLevel_GravitationalMaze, 25),
];
#endregion

area_completed = array_create(LEVEL_AREA.COUNT);
area_unlocked = array_create(LEVEL_AREA.COUNT);

// by default, only beginner is availible
for (var i = 1; i < LEVEL_AREA.COUNT; i++)
	area_unlocked[i] = false;
area_unlocked[LEVEL_AREA.BEGINNER] = true;

// by default, no level types have been completed
for (var i = 1; i < LEVEL_AREA.COUNT; i++)
	area_completed[i] = false;

// in the case that the player has save data, load it
if (!debug_mode || DEBUG_LOAD_DATA) my_game_load();

// unlock all levels, if desired
if (DEBUG_UNLOCK_ALL)
{
	for (var i = 0; i < LEVEL_AREA.COUNT; i++)
	{
		area_unlocked[i] = true;
		area_completed[i] = true;
	}
}

// an array of rooms for difficulty select
menu_level_rooms = array_create(LEVEL_AREA.COUNT);
menu_level_rooms[0] = rMenuArea01;
menu_level_rooms[1] = rMenuArea02;
menu_level_rooms[2] = rMenuArea03;
menu_level_rooms[3] = rMenuArea04;

draw_set_font(fnUI);
room_goto((debug_mode) ? DEBUG_START_ROOM : rMenuMain);

