/// @description display press any key

var _w = display_get_gui_width();
var _h = display_get_gui_height();

set_draw(c_black, lerp(1, 0, alarm[0] / room_speed));
draw_rectangle(0, 0, _w, _h, false);