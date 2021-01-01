// input vars
rot_input = 0;
xmouse = 0;
ymouse = 0;

// vars
enabled_deadzone = false;

w = display_get_gui_width();
h = display_get_gui_height();
w_half = w * 0.5;
h_half = h * 0.5;
max_range = w * 0.2;
w_min = w_half - max_range;
w_max = w_half + max_range;

xdeadzone = w * 0.005;
xdeadzone_min = w_half - xdeadzone;
xdeadzone_max = w_half + xdeadzone;