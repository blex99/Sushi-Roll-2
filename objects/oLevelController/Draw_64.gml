draw_set_alpha(1);
draw_set_color(c_blue);
draw_line(w_min, h_half, w_max, h_half);
draw_line(w_half, h_half+3, w_half, h_half-3);
draw_circle(rot_input, h_half, 2, 0);