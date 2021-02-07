/// @description init resolution, level array

#region init resolution
var _display_w = display_get_width();
var _display_h = display_get_height();

window_scale = 1;
gui_scale = 1;

// dynamically determine width to fit screen
ideal_width = 0;
ideal_height = BASE_H;

aspect_ratio = _display_w / _display_h;
ideal_width = round(ideal_height * aspect_ratio);

// check for odd numbers...
if (ideal_width & 1) ideal_width++;

// find the largest scale possible that will fit on the monitor dimensions
window_scale_max = 1;
while (_display_w >= BASE_W * window_scale_max &&
	   _display_h >= BASE_H * window_scale_max)
{
	window_scale_max++;
}
window_scale_max--;

game_resize_window();
#endregion

#region level array
level_index = -1;
levels =
[
	rLevelEasy01, rLevelEasy02, rLevelEasy03, rLevelEasy04, rLevelEasy05,
	rLevelMedium01, rLevelMedium02, rLevelMedium03, rLevelMedium04, rLevelMedium05,
	rLevelHard01, rLevelHard02, rLevelHard03, rLevelHard04, rLevelHard05
];
level_first_try = true; // player hasn't died yet?
#endregion

draw_set_font(fnUI);
room_goto(START_ROOM);
