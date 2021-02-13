/// @description red shade (when theres 10 seconds remaining)

if (level_is_state(LEVEL.PLAYING))
{
	var _w = display_get_gui_width();
	var _h = display_get_gui_height();

	if (timer_get_time() < room_speed * 10)
	{
		set_draw(c_red, oscillate(0.2, 0.05, 1));
		draw_rectangle(0, 0, _w, _h, false)
	}

	reset_alpha();
}
