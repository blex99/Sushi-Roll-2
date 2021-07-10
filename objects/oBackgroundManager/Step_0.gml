/// @description parallax
var _layer = layer_get_id(bg_name);
x = camera_get_view_x(CAM) * 0.25;
y = camera_get_view_y(CAM) * 0.05;
layer_x(_layer, x);
layer_y(_layer, y);

