/// @description get bg layer

var _layer = layer_get_id("Background");
layer_set_visible(_layer, true);
bg_layer = layer_background_get_id(_layer);
layer_shader(_layer, shDarker);

layer_shader(layer_get_id("Instances"), shLighter);
layer_shader(layer_get_id("Sushi"), shLighter);
layer_shader(layer_get_id("Wall"), shLighter);
layer_shader(layer_get_id("WallBackground"), shLighter);

alarm[0] = 1; //change background based on area
