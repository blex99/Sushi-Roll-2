/// @desc display score, time, counters, victory screen

if (level_is_state(LEVEL.COMPLETE)) exit;

var _arr =
[
	"Rice: " + string(rice_count) + " / " + string(rice_max), 
	"Collectibles: " + string(collectible_count) + " / " + string(collectible_max),
	"Level Score Total: " + string(level_score)
];
var _len = array_length(_arr);
var _color = stats_collected_everything() ? c_maroon : c_black;
var _alpha = stats_collected_everything() ? oscillate(0.9, 0.1, 0.5) : 1;

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
for (var _count = 0; _count < _len; _count++)
{
	var _offset = font_height * (_count - 1);
	draw_text(_xcenter, _ycenter + _offset, _arr[_count]);
}

reset_alpha();