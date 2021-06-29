/// @description display timer and red shade

// do not display while not playing
if (!instance_exists(oLevelManager) ||
	!level_is_state(LEVEL.PLAYING)) exit;

var _time_string = string_format(mus2sec(timer), 2, 2);
//_time_string = string_right_pad_zeros(_time_string, 4);
var _w_half = GUI_W / 2;
var _x1, _y1, _x2, _y2, _xcenter, _ycenter;
var _color = c_black;
var _alpha = stats_time_goal_met() ? oscillate(0.5, 0.5, 0.25) : 1;

_x1 = _w_half - buffer;
_y1 = offset;
_x2 = _w_half + buffer;
_y2 = offset  + buffer;
_xcenter = average([_x1, _x2]);
_ycenter = average([_y1, _y2]);

ui_nine_slice_box(border_sprite, _x1, _y1, _x2, _y2, global.ui_sub_image);
set_draw(_color, _alpha, font, fa_center, fa_center);
draw_text_with_outline(_xcenter, _ycenter, _time_string);

reset_alpha();