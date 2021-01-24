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
	
	var _str = 
	[
		string(timer_calc_time_bonus()),
		string(rice_value * rice_count),
		string(collectible_value * collectible_count),
		string(level_score)
	];
	
	// add zeros to points until there are four total digits
	for (var _i = 0; _i < array_length(_str); _i++)
	{
		while (string_length(_str[_i]) < 4)
			_str[_i] = string_insert("0", _str[_i], 0);
	}

	_arr =
	[
		"Level Complete!\n",
		"----------------",
		"Points\n",
		"Time: "				+ _str[0],
		"Rice: "				+ _str[1], 
		"Collectibles: "		+ _str[2],
		"Level Score Total: "	+ _str[3],
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
	var _len = array_length(_arr);
	
	ui_nine_slice_box(sNineSliceBoxInGameUI, 0, 0, _w / 4, (2 + _len) * _buff);
	
	// score text (large)
	// starting count at one to skip the "level complete message"
	set_draw(c_black, 1, _font, fa_top, fa_left);
	for (_count = 0; _count < _len; _count++)
		draw_text(_buff, _buff * _count + _buff - 1, _arr[_count]);
}

reset_alpha();