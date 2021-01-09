/// @description display timer and red shade

var _time_string = string(level_timer / room_speed);
var _w = display_get_gui_width();
var _h = display_get_gui_height();

// red shade (when theres 10 seconds remaining)
if (level_timer < room_speed * 10)
{
	set_draw(c_red, 0.2);
	draw_rectangle(0, 0, _w, _h, false)
}

set_draw(c_black, 1, fnUIBig, fa_top, fa_center);
draw_text(_w / 2, 0, _time_string);

reset_alpha();