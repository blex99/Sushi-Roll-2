// start of level pan from goal to sushi

var _zoom_target = zoom;
var _sushi = sushi_cur();

// if you're in a level room, pretty much
if (instance_exists(follow))
{
	xfollow = follow.x;	
	yfollow = follow.y;
	
	// zoom out as sushi gets bigger
	if (reached_sushi_start)
	{
		_zoom_target = _sushi.image_xscale; // starts as 1...
	}
	else // camera is panning from goal to sushi
	{
		// ensure follow clamps too when checking for equality...
		var _xf = clamp(xfollow, view_w_half, room_width - view_w_half);
		var _yf = clamp(yfollow, view_h_half, room_height - view_h_half);
	
		if (follow == _sushi && abs(x - _xf) < 1 && abs(y - _yf) < 1)
		{
			level_start_countdown();
			xstrength = 2; // follow more rigid in the x
			ystrength = 5;
			reached_sushi_start = true;
		}
		else if (input_one_pressed()) // skip panning
		{
			alarm[0] = 1;
			xstrength = 1;
			ystrength = 1;
		}
	}
}

#region debug zoom
if (debug_mode)
{
	if (keyboard_check_pressed(ord("Z")))
		_zoom_target += 0.5;
	
	if (keyboard_check_pressed(ord("X")))
		_zoom_target -= 0.5;
}
#endregion

x += (xfollow - x) / xstrength;
y += (yfollow - y) / ystrength; 

x = clamp(x, view_w_half, room_width - view_w_half);
y = clamp(y, view_h_half, room_height - view_h_half);

zoom = approach(zoom, _zoom_target, 0.005);
camera_zoom(zoom);

camera_set_view_pos(cam, x - view_w_half, y - view_h_half);

add_to_debug_map("zoom: " + string(zoom));