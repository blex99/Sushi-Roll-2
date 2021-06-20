/// @desc display score, time, counters, victory screen

if (!instance_exists(oLevelManager) ||
	!level_is_state(LEVEL.PLAYING)) exit;

var _arr =
[
	"Rice: "			+ string(rice_count) + " / " + string(rice_max), 
	"Collectibles: "	+ string(collectible_count) + " / " + string(collectible_max),
];
var _len = array_length(_arr);
var _color = stats_got_all_collectibles() ? c_maroon : c_black;
var _alpha = stats_under_time_requirement() ? oscillate(0.75, 0.25, 0.25) : 1;

// coordinates of box
var _x1, _y1, _x2, _y2, _xcenter, _ycenter;
_x1 = offset;
_y1 = offset;
_x2 = offset + rect_width;
_y2 = offset + (2 + _len) * font_height;
_xcenter = average([_x1, _x2]);
_ycenter = average([_y1, _y2]);

// draw the box for stats
ui_nine_slice_box(border_sprite, _x1, _y1, _x2, _y2);
	
// score text
set_draw(_color, _alpha, font, fa_center, fa_center);
for (var i = 0; i < _len; i++)
{
	var _ypos = find_position_from_center(i, _len, font_height, _ycenter);
	draw_text_with_outline(_xcenter, _ypos, _arr[i]);
}

reset_alpha();