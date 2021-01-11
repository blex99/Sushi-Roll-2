/// @description display timer and red shade

var _time_string = string_format(level_timer / room_speed, 2, 2);
var _w_half = display_get_gui_width() / 2;
var _font = fnUIBig;
var _buff = font_get_size(_font) * 2;
var _x1, _y1, _x2, _y2;

_x1 = _w_half - _buff;
_y1 = 0;
_x2 = _w_half + _buff;
_y2 = _buff;

ui_nine_slice_box(sNineSliceBox, _x1, _y1, _x2, _y2);
set_draw(c_black, 1, _font, fa_center, fa_center);
draw_text(_w_half, _buff / 2, _time_string);

reset_alpha();