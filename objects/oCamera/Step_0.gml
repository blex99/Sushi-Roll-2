// start of level pan from goal to sushi

// skip if you're not in a level room
if (follow_size == 0 || level_is_state(LEVEL.PAUSED)) exit;

var _sushi = sushi_cur();
var _following = follows[follow_index];

xfollow = round(_following.x);
yfollow = round(_following.y);

if (level_is_state(LEVEL.PANNING))
{
	// ensure follow clamps too when checking for equality...
	var _xf = clamp(xfollow, view_w_half, room_width - view_w_half);
	var _yf = clamp(yfollow, view_h_half, room_height - view_h_half);
	var _cam_reached_target = abs(x - _xf) < 5 && abs(y - _yf) < 5;
	
	if (_following == _sushi && _cam_reached_target)
	{
		// finished panning
		level_start_countdown();
		strength = strength_playing;
	}
	else if (input_one_pressed() && (!oGame.level_first_try || debug_mode))
	{
		// skip panning
		follow_index = follow_size - 1;
		x = xfollow;
		y = yfollow;
	}
}

x = lerp(x, xfollow, strength);
y = lerp(y, yfollow, strength);

x = clamp(x, view_w_half, room_width - view_w_half);
y = clamp(y, view_h_half, room_height - view_h_half);

camera_set_view_pos(CAM, x - view_w_half, y - view_h_half);

