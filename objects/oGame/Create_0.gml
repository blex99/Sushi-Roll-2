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
#endregion

#region level array
level_index = -1;
level_first_try = true; // player hasn't died yet?
levels = 
[
	level_create("Starting Out", rLevelBeg01, "Easy", sec2mus(90), 0, 10),
	level_create("Upping the Pace", rLevelBeg02, "Easy", sec2mus(90), 0, 30),
	level_create("Counting Calories", rLevelBeg03, "Easy", sec2mus(90), 0, 30),
	level_create("Jumping Olympics: Bronze", rLevelBeg04, "Easy", sec2mus(90), 0, 30),
	level_create("Slippery Sliding Sashimi", rLevelBeg05, "Easy", sec2mus(90), 0, 30),
	
	level_create("Octopus", rLevelInt01, "Intermediate", sec2mus(90), 0, 30),
	level_create("Spring Forward", rLevelInt02, "Intermediate", sec2mus(90), 0, 30),
	level_create("Ramps", rLevelInt03, "Intermediate", sec2mus(90), 0, 30),
	level_create("Big Knives", rLevelInt04, "Intermediate", sec2mus(90), 0, 30),
	level_create("Trapdoor Track Lesson", rLevelInt05, "Intermediate", sec2mus(90), 0, 30),
	
	level_create("Up and Away", rLevelExp01, "Expert", sec2mus(90), 0, 30),
	level_create("Down You Go", rLevelExp02, "Expert", sec2mus(90), 0, 30),
	level_create("Slow and Steady", rLevelExp03, "Expert", sec2mus(90), 0, 30),
	level_create("A Hard Level", rLevelExp04, "Expert", sec2mus(90), 0, 30),
	level_create("Jumping Olympics: Silver", rLevelExp05, "Expert", sec2mus(90), 0, 30),
];

#endregion

draw_set_font(fnUI);
room_goto((debug_mode) ? DEBUG_START_ROOM : rStartScreen);

