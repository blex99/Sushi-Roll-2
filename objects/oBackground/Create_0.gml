/// @description change based on area

// TODO lags the fk out of the game, change to background layer...
var i = game_get_area_index();
if (i != -1) image_index = i;
image_speed = 0;
var _hex = $55;
image_blend = make_colour_rgb(_hex, _hex, _hex);
image_xscale = 500;
image_yscale = 500;