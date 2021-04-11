// start of level pan from goal to sushi

// skip if you're not in a level room
if (follow_size == 0 || level_is_state(LEVEL.PAUSED)) exit;

var _sushi = sushi_cur();

xfollow = round(follows[follow_index].x);
yfollow = round(follows[follow_index].y);

if (level_is_state(LEVEL.PANNING))
{
	// option to skip panning
	if (input_one_pressed() && (!oGame.level_first_try || debug_mode))
	{
		info_box_create("Skipped Panning!");
		follow_index = follow_size - 1; // set index to be index of sushi
		
		xfollow = round(follows[follow_index].x);
		yfollow = round(follows[follow_index].y);
		
		x = xfollow;
		y = yfollow;
		
		// we don't want the timer to be created and skipped on the same frame
		exit;
	}
	
	// ensure follow clamps too when checking for equality...
	var _xf = clamp(xfollow, view_w_half, room_width - view_w_half);
	var _yf = clamp(yfollow, view_h_half, room_height - view_h_half);
	var _cam_reached_target = abs(x - _xf) < 5 && abs(y - _yf) < 5;
	
	if (_cam_reached_target)
	{
		if (alarm[0] == -1) alarm[0] = room_speed / 2;
		
		if (follows[follow_index] == _sushi)
		{
			// finished panning
			level_start_countdown();
			strength = strength_playing;
			zoom_target = 1;
		}
	}
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
x = lerp(x, xfollow, strength);
y = lerp(y, yfollow, strength);

x = clamp(x, view_w_half, room_width - view_w_half);
y = clamp(y, view_h_half, room_height - view_h_half);

camera_set_view_pos(CAM, x - view_w_half, y - view_h_half);

add_to_debug_map("alarm[0]: " + string(alarm[0]));

