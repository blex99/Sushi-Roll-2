/// @description parallax

x = camera_get_view_x(CAM) * 0.25;
y = camera_get_view_y(CAM) * 0.05;
layer_x(bg_layer, x);
layer_y(bg_layer, y);

