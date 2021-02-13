/// @description displays lvl name & other info

if (level_is_state(LEVEL.PAUSED)) exit;

// level room names have the format: rLevel##
//                                   12345678
//                                         ^^
//	  these are the numbers im looking for ||

var _w = display_get_gui_width();
var _h = display_get_gui_height();
var _room_name = room_get_name(room);
var _room_name_length = string_length(_room_name);
var _room_num = string_char_at(_room_name, _room_name_length-1) +
				string_char_at(_room_name, _room_name_length);
var _msg = "";
set_draw(c_black, 1, fnUIBig, fa_center, fa_center);

if (level_is_state(LEVEL.PANNING))
{
	_msg = "~ Level " + _room_num;
	if (level_name != "") _msg += " - " + level_name;
	_msg +=  " ~";
	
	draw_set_alpha(ui_alpha);
}
else if (level_is_state(LEVEL.COUNTING_DOWN))
{
	_msg = "Ready?";
}
else if (level_is_state(LEVEL.PLAYING))
{
	_msg = "Go!";
	draw_set_alpha(ui_alpha);
}
else if (level_is_state(LEVEL.TIME_OUT))
{
	_msg = "Out of time!"
}

draw_text(_w / 2, _h / 4, _msg);

reset_alpha();