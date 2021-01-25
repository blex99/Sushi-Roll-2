/// @description display timer and red shade

var _time_string = string_format(timer / room_speed, 2, 2);
//_time_string = string_right_pad_zeros(_time_string, 4);
var _w_half = display_get_gui_width() / 2;
var _x1, _y1, _x2, _y2, _xcenter, _ycenter;

_x1 = _w_half - buffer;
_y1 = offset;
_x2 = _w_half + buffer;
_y2 = offset  + buffer;
_xcenter = average([_x1, _x2]);
_ycenter = average([_y1, _y2]);

ui_nine_slice_box(border_sprite, _x1, _y1, _x2, _y2);
set_draw(c_black, 1, font, fa_center, fa_center);
draw_text(_xcenter, _ycenter, _time_string);

reset_alpha();