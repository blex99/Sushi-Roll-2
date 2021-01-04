draw_self();

if (active)			draw_set_color(c_green);
else if (in_range)	draw_set_color(c_yellow);
else				draw_set_color(c_red);	

draw_set_alpha(1);
draw_circle(xcenter, ycenter, radius, true);