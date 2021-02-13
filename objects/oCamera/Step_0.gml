// start of level pan from goal to sushi

// skip if you're not in a level room
if (follow_size == 0 || level_is_state(LEVEL.PAUSED)) exit;

var _zoom_target = zoom;
var _sushi = sushi_cur();
var _following = follows[follow_index];

xfollow = _following.x;	
yfollow = _following.y;
	
if (level_is_state(LEVEL.PANNING))
{
	// ensure follow clamps too when checking for equality...
	var _xf = clamp(xfollow, view_w_half, room_width - view_w_half);
	var _yf = clamp(yfollow, view_h_half, room_height - view_h_half);
		
	if (_following == _sushi && abs(x - _xf) < 1 && abs(y - _yf) < 1)
	{
		// finished panning
		level_start_countdown();
		strength = 1 / 3;
	}
	else if (input_one_pressed() && (!oGame.level_first_try || debug_mode))
	{
		// skip panning
		follow_index = follow_size - 1;
		strength = 1;
	}
}
else
{
	// zoom out as sushi gets bigger
	_zoom_target = lerp(zoom_in_game_min, zoom_in_game_max, sushi_get_size_normalized());
}


zoom = lerp(zoom, _zoom_target, 0.05);
camera_zoom(zoom);

x = lerp(x, xfollow, strength);
y = lerp(y, yfollow, strength);

x = clamp(x, view_w_half, room_width - view_w_half);
y = clamp(y, view_h_half, room_height - view_h_half);

camera_set_view_pos(cam, x - view_w_half, y - view_h_half);

