/// @description init resolution level array

ideal_width = 0;
ideal_height = RES_H;

aspect_ratio = display_get_width() / display_get_height();
ideal_width = round(ideal_height * aspect_ratio);

// check for odd numbers...
if (ideal_width & 1) ideal_width++;

surface_resize(application_surface, ideal_width, ideal_height);
window_set_size(ideal_width, ideal_height);
display_set_gui_size(ideal_width, ideal_height);
alarm[0] = 1;

draw_set_font(fnUI);
level_index = 0;
levels =
[
	rLevel01, rLevel02, rLevel03, rLevel04, rLevel05,
	rLevel06, rLevel07, rLevel08, rLevel09, rLevel10,
];

room_goto(rHowToPlay);