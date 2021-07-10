/// @description get bg layer

bg_name = "Background";
layer_set_visible(bg_name, true);
layer_shader(bg_name, shDarker);

bg_layer = layer_background_get_id(bg_name);

layer_shader("Instances",		shLighter);
layer_shader("Sushi",			shLighter);
layer_shader("Wall",			shLighter);
layer_shader("WallBackground",	shLighter);

alarm[0] = 1; // change background based on area