/// @description display how to play msg

var _w = display_get_gui_width();
var _w_half = _w / 2;

var _h = display_get_gui_height();
var _h_half = _h / 2;

// draw box
ui_nine_slice_box(box_sprite, _w_half - box_width_half, _h_half - box_height_half, 
							  _w_half + box_width_half, _h_half + box_height_half);

// draw exit text
set_draw(c_white, 1, fnDebug, fa_top, fa_right);
draw_text(_w, 0, (global.using_controller ? "Press Start to Exit" : "Press Esc to Exit"));

// draw how to play text
set_draw(c_black, 1, font, fa_center, fa_center);
if (message_index < messages_length)
	draw_text_ext(_w_half, _h_half, messages[message_index], vbuffer * 2, _w_half - 32);