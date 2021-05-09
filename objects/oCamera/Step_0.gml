// start of level pan from goal to sushi

// skip if you're not in a level room or paused
if (!instance_exists(oLevelManager)) exit;
if (level_is_state(LEVEL.PAUSED))
{
	path_speed = 0;
}

if (level_is_state(LEVEL.PANNING) && alarm[0] == -1)
{
	// speed up panning by holding button
	path_speed = (input_one()) ? my_path_speed * 4 : my_path_speed;
}

// change size of the camera zoom
zoom = lerp(zoom, zoom_target, 0.1);
view_w = BASE_W * zoom;
view_h = BASE_H * zoom;
view_w_half = view_w * 0.5;
view_h_half = view_h * 0.5;
camera_set_view_size(CAM, view_w, view_h);

// rotate the camera (in the advent of gravity mod)
var _angle = camera_get_view_angle(CAM);
var _angle_diff = angle_difference(_angle, target_angle);
_angle -= min(abs(_angle_diff), 5) * sign(_angle_diff);
camera_set_view_angle(CAM, _angle);

// change the position of the camera
// strength range: 0 < x <= 1, 1 being strongest
if (!level_is_state(LEVEL.PANNING))
{
	var _sushi = sushi_cur();
	xfollow = round(_sushi.x);
	yfollow = round(_sushi.y);
	x = lerp(x, xfollow, 1 / 3); 
	y = lerp(y, yfollow, 1 / 3);
}

x = clamp(x, view_w_half, room_width - view_w_half);
y = clamp(y, view_h_half, room_height - view_h_half);
camera_set_view_pos(CAM, x - view_w_half, y - view_h_half);
