var _max_width_pix = 0;
var _box_height_half, _box_width_half;
var _color = stats_got_all_collectibles() ? c_maroon : c_black;
var _alpha = stats_time_goal_met() ? oscillate(0.75, 0.25, 0.25) : 1;
var _x1, _y1, _x2, _y2, _xcenter, _ycenter;

// determine how wide the box needs to be
draw_set_font(font);
for (var i = 0; i < len; i++)
	_max_width_pix = max(_max_width_pix, string_width(arr[i]));

_box_width_half  = _max_width_pix * 0.75;
_box_height_half = vertical_buffer * (len + 4) / 2;

_x1 = cur.x - _box_width_half;
_y1 = cur.y - _box_height_half;
_x2 = cur.x + _box_width_half;
_y2 = cur.y + _box_height_half;
_xcenter = average([_x1, _x2]);
_ycenter = average([_y1, _y2]);

ui_nine_slice_box(global.border_sprite, _x1, _y1, _x2, _y2);

set_draw(_color, _alpha, font, fa_center, fa_center);
for (var i = 0; i < len; i++)
{
	var _ypos = find_position_from_center(i, len, vertical_buffer, _ycenter);
	if (arr[i] == "New Record!" || arr[i] == "Time Goal met!")
		draw_set_color(c_maroon);
	draw_text_with_outline(_xcenter, _ypos, arr[i]);
}

reset_alpha();