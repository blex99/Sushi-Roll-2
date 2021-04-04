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
		follow_index = follow_size - 1;
		
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
	
	if (follows[follow_index] == _sushi && _cam_reached_target)
	{
		// finished panning
		level_start_countdown();
		strength = strength_playing;
	}
}

x = lerp(x, xfollow, strength);
y = lerp(y, yfollow, strength);

x = clamp(x, view_w_half, room_width - view_w_half);
y = clamp(y, view_h_half, room_height - view_h_half);

// rotate the camera (in the advent of gravity mod)
var _angle = camera_get_view_angle(CAM);
_angle = lerp(_angle, target_angle, 0.1);
camera_set_view_angle(CAM, _angle);

camera_set_view_pos(CAM, x - view_w_half, y - view_h_half);

