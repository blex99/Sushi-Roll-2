/// @description display how to play msg

var _w_half = display_get_gui_width() / 2;
var _h_half = display_get_gui_height() / 2;
var _sep = font_get_size(font) * 2;

set_draw(c_white, 1, font, fa_center, fa_center);

if (message_index == 1) set_draw(c_green);
if (message_index == 2) set_draw(c_red);

if (message_index < array_length(messages))
	draw_text_ext(_w_half, _h_half, messages[message_index], _sep, _w_half);