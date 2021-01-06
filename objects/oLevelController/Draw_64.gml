if (!input_controller_active())
{
	draw_set_alpha(0.5);
	draw_set_color(c_black);
	var _t = 0.5; // thickness
	draw_rectangle(w_min, h_half-_t, w_max, h_half+_t, false);
	draw_rectangle(w_half-_t, h_half+6, w_half+_t, h_half-6, false);
	draw_circle(input_x_mouse_clamp(w_min, w_max), h_half, 4, 0);
	
	draw_set_alpha(1);
}