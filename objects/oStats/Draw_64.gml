/// @desc display score, time, counters, victory screen

if (!instance_exists(oLevelManager) ||!level_is_state(LEVEL.PLAYING))
	exit;

#region items
var _msg = "Rice x" + string_right_pad_zeros(string(rice_count), 2);
var _x1, _y1, _x2, _y2, _xcenter, _ycenter;
var _x_cur_offset = buffer * 2;

// coordinates of box
_x1 = buffer;
_y1 = buffer;
_x2 = buffer + item_box_width + buffer;
_y2 = buffer + item_box_height + buffer;
_xcenter = average([_x1, _x2]);
_ycenter = average([_y1, _y2]);

// draw the box for stats
ui_nine_slice_box(border_sprite, _x1, _y1, _x2, _y2, 0);

// score text
set_draw(c_black, 1, item_font, fa_center, fa_left);
draw_text_with_outline(_x_cur_offset, _ycenter, _msg);

// draw orange and wasabi
_x_cur_offset += string_width(_msg) + buffer;
draw_sprite_stretched(sCollectibleOrange, level_is_orange_collected() ? 0 : 1, 
	_x_cur_offset,
	_ycenter - collectible_size / 2,
	collectible_size, collectible_size);

_x_cur_offset += collectible_size + buffer;
draw_sprite_stretched(sCollectibleWasabi, level_is_wasabi_collected() ? 0 : 1, 
	_x_cur_offset,
	_ycenter - collectible_size / 2,
	collectible_size, collectible_size);
#endregion

#region speed
draw_set_font(fnUIBig);
var _speed = string(sushi_get_speed());
_msg = string_right_pad_zeros(_speed, 2) + " mph";
_x1 = GUI_W - speed_box_width - buffer;
_y1 = GUI_H - speed_box_height - buffer;
_x2 = GUI_W - buffer
_y2 = GUI_H - buffer;
_xcenter = average([_x1, _x2]);
_ycenter = average([_y1, _y2]);

// background box
ui_nine_slice_box(border_sprite, _x1, _y1, _x2, _y2, 0);

// draw speed of sushi
set_draw(c_black, 1, fnUIBig, fa_center, fa_center);
draw_text_with_outline(_xcenter, _ycenter, _msg);

#endregion

reset_alpha();
