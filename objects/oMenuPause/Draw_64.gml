/// @description black shade

var _w = display_get_gui_width();
var _h = display_get_gui_height();

set_draw(c_black, 0.5);
draw_rectangle(0, 0, _w, _h, false);