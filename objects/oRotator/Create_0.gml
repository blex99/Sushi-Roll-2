// input vars
rot_input = 0;
xrotateable = 0;
yrotateable = 0;

rot_strength = 5;

w = display_get_gui_width();
h = display_get_gui_height();
w_half = w * 0.5;
h_half = h * 0.5;
max_range = w * 0.2;
w_min = w_half - max_range;
w_max = w_half + max_range;