/// @desc display score, time, counters, victory screen

var _font;
var _buff; // calculated by getting font height
var _count = 0;
var _w = display_get_gui_width();
var _h = display_get_gui_height();
var _arr;

if (is_level_complete())
{
	_font = fnUIBig;
	_buff = font_get_size(_font);
	_arr =
	[
		"Level Complete!\n",
		"-----------------",
		"Points\n",
		"Time: " + string(timer_calc_time_bonus()),
		"Rice: " + string(rice_value * rice_count), 
		"Collectibles: " + string(collectible_value * collectible_count),
		"Level Score Total: " + string(level_score), 
		"-----------------",
		"\nPress Left Click or A to Continue"
	];
	
	// black shade over screen
	set_draw(c_black, 0.5);
	draw_rectangle(0, 0, _w, _h, false);
	// score text
	set_draw(c_white, 1, _font, fa_center, fa_center);
	for (_count = 0; _count < array_length(_arr); _count++)
		draw_text(_w / 2, (_h / 4) + (_buff * _count), _arr[_count]);
}
else // level is NOT complete...
{
	_font = fnUI;
	_buff = font_get_size(_font);
	_arr =
	[
		"Rice: " + string(rice_count) + " / " + string(rice_max), 
		"Collectibles: " + string(collectible_count) + " / " + string(collectible_max),
		"Level Score Total: " + string(level_score)
	];
	
	// score text (large)
	// starting count at one to skip the "level complete message"
	set_draw(c_black, 1, _font, fa_top, fa_left);
	for (_count = 0; _count < array_length(_arr); _count++)
		draw_text(0, _buff * _count, _arr[_count]);
}

reset_alpha();