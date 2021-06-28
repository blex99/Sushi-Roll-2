/// @description change based on area

var i = game_get_area_index();
if (i != -1) image_index = i;
image_speed = 0;
image_blend = c_grey;
image_xscale = 500;
image_yscale = 500;