/// @description display how to play msg

var _w = display_get_gui_width();
var _h = display_get_gui_height();

set_draw(c_white, 1, fnUIBig, fa_center, fa_center);
draw_text(_w / 2, _h / 2, msg);