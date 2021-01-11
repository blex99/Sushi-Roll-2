/// @description displays room level name

// level room names have the format: rLevel##
//                                   12345678
//                                         ^^
//	  these are the numbers im looking for ||

var _w = display_get_gui_width();
var _h = display_get_gui_height();
var _room_name = room_get_name(room);
var _room_num = string_char_at(_room_name, 7) +
				string_char_at(_room_name, 8);

set_draw(c_black, ui_alpha, fnUIBig, fa_center, fa_center);

if (paused)
{
	set_draw(c_black, 0.8);
	draw_rectangle(0, 0, _w, _h, false);
	
	set_draw(c_white, 1);
	draw_text(_w / 2, _h / 4, "~ Paused ~\n" + 
		"Press Left Mouse or A to restart level.\n" + 
		"Press P or Start again to unpause.");
}
else
{
	draw_set_alpha(ui_alpha);
	draw_text(_w / 2, _h / 4, "~ Level " + _room_num + " ~");
}

reset_alpha();