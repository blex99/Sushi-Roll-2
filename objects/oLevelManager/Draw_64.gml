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
draw_text(_w / 2, _h / 4, "~ Level " + _room_num + " ~");
reset_alpha();