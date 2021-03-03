/// @description display made by and fadeout

var _w = display_get_gui_width();
var _h = display_get_gui_height();

set_draw(c_black, 1, fnUIBig, fa_center, fa_center);
draw_text_with_outline(_w * 0.5, _h * 0.5, msg);

set_draw(c_black, lerp(1, 0, alarm[0] / room_speed));
draw_rectangle(0, 0, _w, _h, false);