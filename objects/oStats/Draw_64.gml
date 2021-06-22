/// @desc display score, time, counters, victory screen

if (!instance_exists(oLevelManager) ||
	!level_is_state(LEVEL.PLAYING)) exit;

// collectible sprite size
var _collectible_spr_s = sprite_get_height(sCollectibleOrange);
var _rice_msg = "Rice: " + string(rice_count)
var _color = c_black;
var _alpha = 1;

// coordinates of box
var _x1, _y1, _x2, _y2, _xcenter, _ycenter;
_x1 = offset;
_y1 = offset;
_x2 = offset + rect_width;
_y2 = offset + _collectible_spr_s + font_height * 3; // rice_msg + 2 for buffer
_xcenter = average([_x1, _x2]);
_ycenter = average([_y1, _y2]);

// draw the box for stats
ui_nine_slice_box(border_sprite, _x1, _y1, _x2, _y2);

// score text
set_draw(_color, _alpha, font, fa_center, fa_center);
var _ypos = find_position_from_center(0, 2, _collectible_spr_s, _ycenter);
draw_text_with_outline(_xcenter, _ypos, _rice_msg);

// draw orange and wasabi
_ypos = find_position_from_center(1, 2, _collectible_spr_s, _ycenter)
draw_sprite(sCollectibleOrange, level_is_orange_collected() ? 0 : 1, 
	_xcenter - rect_width * 0.2 - _collectible_spr_s / 2,
	_ypos - _collectible_spr_s * 0.75);
draw_sprite(sCollectibleWasabi, level_is_wasabi_collected() ? 0 : 1, 
	_xcenter + rect_width * 0.2 - _collectible_spr_s / 2,
	_ypos - _collectible_spr_s * 0.75);

reset_alpha();