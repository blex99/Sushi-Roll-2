/// @description displays room level name and pause menu

// level room names have the format: rLevel##
//                                   12345678
//                                         ^^
//	  these are the numbers im looking for ||

var _w = display_get_gui_width();
var _h = display_get_gui_height();
var _room_name = room_get_name(room);
var _room_num = string_char_at(_room_name, 7) +
				string_char_at(_room_name, 8);
var _msg = "";
set_draw(c_black, 1, fnUIBig, fa_center, fa_center);

if (state == LEVEL.PANNING_TO_SUSHI)
{
	_msg = "~ Level " + _room_num;
	if (level_name != "") _msg += " - " + level_name;
	_msg +=  " ~";
	
	draw_set_alpha(ui_alpha);
}
else if (state == LEVEL.COUNTING_DOWN)
{
	_msg = "Ready?";
}
else if (state == LEVEL.PLAYING)
{
	_msg = "Go!";
	draw_set_alpha(ui_alpha);
}
else if (state == LEVEL.TIME_OUT)
{
	_msg = "Out of time!"
}

draw_text(_w / 2, _h / 4, _msg);

reset_alpha();