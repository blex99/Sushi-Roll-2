var _w_half = display_get_gui_width() / 2;
var _h_half = display_get_gui_height() / 2;
var _max_width_pix = 0;
var _box_height_half, _box_width_half;
var _color = stats_got_all_collectibles() ? c_maroon : c_black;
var _alpha = stats_under_time_requirement() ? oscillate(0.75, 0.25, 0.25) : 1;
var _x1, _y1, _x2, _y2, _xcenter, _ycenter;

// determine how wide the box needs to be
draw_set_font(font);
for (var i = 0; i < len; i++)
	_max_width_pix = max(_max_width_pix, string_width(arr[i]));

_box_width_half  = _max_width_pix * 0.75;
_box_height_half = vertical_buffer * (len + 2) / 2;

_x1 = _w_half - _box_width_half + xoffset;
_y1 = _h_half - _box_height_half + yoffset;
_x2 = _w_half + _box_width_half + xoffset;
_y2 = _h_half + _box_height_half + yoffset;
_xcenter = average([_x1, _x2]);
_ycenter = average([_y1, _y2]);

ui_nine_slice_box(global.border_sprite, _x1, _y1, _x2, _y2);

set_draw(_color, _alpha, font, fa_center, fa_center);
for (var i = 0; i < len; i++)
{
	var _even_offset = (len % 2 != 0) ? 0.5 : 0;
	var _percent = (i + _even_offset - len / 2);
	var _offset = vertical_buffer * _percent;
	draw_text_with_outline(_xcenter, _ycenter + _offset, string(_offset) + " " + string(_percent));//arr[i]);
}
