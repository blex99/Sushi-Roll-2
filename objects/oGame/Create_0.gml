/// @description init resolution, level array

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

draw_set_font(fnUI);
level_index = -1;
levels =
[
	rLevel01, rLevel02, rLevel03, rLevel04, rLevel05,
	rLevel06, rLevel07, rLevel08, rLevel09, rLevel10,
];
level_first_try = true; // player hasn't died yet?

room_goto(rStartScreen);