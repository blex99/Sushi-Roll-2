/// @description display how to play msg

var _w = display_get_gui_width();
var _h = display_get_gui_height();
var _font = fnUIBig;
set_draw(c_white, 1, _font, fa_center, fa_center);

if (index == 1) set_draw(c_green);
if (index == 2) set_draw(c_red);

draw_text_ext(_w / 2, _h / 2, arr[index], font_get_size(_font) * 2, _w / 2);