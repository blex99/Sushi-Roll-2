/// @desc display horizontal scroll bar

/*
if (!is_level_complete())
{
	var _font = fnUI;
	var _t = 0.5; // thickness
	var _xpos;
	if (input_controller_active())	_xpos = input_controller_to_mouse_x();
	else							_xpos = input_x_mouse_clamp(w_min, w_max);

	// draw scroll bar, middle line, and position circle
	set_draw(((input_one()) ? c_red : c_green), 0.7, _font, fa_top, fa_center);
	draw_rectangle(w_min, h_half-_t, w_max, h_half+_t, false);
	draw_rectangle(w_half-_t, h_half+6, w_half+_t, h_half-6, false);
	draw_circle(_xpos, h_half, 4, 0);

	// draw sushi speed text on top
	var _msg = string(sushi_cur().phy_linear_velocity_x) + " mph";
	set_draw(c_green, 0.7, _font, fa_bottom, fa_center);
	draw_text(_xpos, h_half - 8, _msg);
	
	// draw angle speed text on bottom
	_msg = string(input_x_axis() * ROT_LIMIT) + "°";
	set_draw(c_red, 0.7, _font, fa_top, fa_center);
	draw_text(_xpos, h_half + 8, _msg);

	reset_alpha();
}
*/
