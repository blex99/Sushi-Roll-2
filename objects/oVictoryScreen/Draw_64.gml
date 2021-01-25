var _w_half = display_get_gui_width() / 2;
var _h_half = display_get_gui_height() / 2;
var _stats = stats_get_array();
var _max_width_pix = 0;
var _box_height_half, _box_width_half;
var _color = stats_collected_everything() ? c_maroon : c_black;
var _alpha = stats_collected_everything() ? oscillate(0.9, 0.1, 0.5) : 1;
var _arr =
[
	"Level Complete!\n",
	"----------------",
	"Points\n",
	"Time: "				+ _stats[0],
	"Rice: "				+ _stats[1], 
	"Collectibles: "		+ _stats[2]
];
	
if (stats_collected_everything())
	array_push(_arr, "Collector's Bonus: " + string(VALUE_COLLECT_EVERYTHING));
	
array_push(_arr,
	"Level Score Total: "	+ _stats[3],
	"-----------------",
	"\nPress Left Click or A to Continue" );

var _len = array_length(_arr);

// determine how wide the box needs to be
draw_set_font(font);
for (var i = 0; i < _len; i++)
	_max_width_pix = max(_max_width_pix, string_width(_arr[i]));

_box_width_half = _max_width_pix * 0.75;
_box_height_half = vertical_buffer * (_len + 2) / 2;

var _x1, _y1, _x2, _y2, _xcenter, _ycenter;
_x1 = _w_half - _box_width_half + xoffset;
_y1 = _h_half - _box_height_half + yoffset;
_x2 = _w_half + _box_width_half + xoffset;
_y2 = _h_half + _box_height_half + yoffset;
_xcenter = average([_x1, _x2]);
_ycenter = average([_y1, _y2]);

ui_nine_slice_box(global.in_game_border_ui, _x1, _y1, _x2, _y2);

set_draw(_color, _alpha, font, fa_center, fa_center);
for (var i = 0; i < _len; i++)
{
	var _offset = vertical_buffer * (i - _len / 2);
	draw_text(_xcenter, _ycenter + _offset, _arr[i]);
}
