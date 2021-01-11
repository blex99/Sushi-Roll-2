/// @description red shade (when theres 10 seconds remaining)

var _w = display_get_gui_width();
var _h = display_get_gui_height();

if (level_timer < room_speed * 10)
{
	set_draw(c_red, 0.2);
	draw_rectangle(0, 0, _w, _h, false)
}
