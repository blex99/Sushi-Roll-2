// start of level pan from goal to sushi

var _sushi_scale = 1;

if (instance_exists(follow))
{
	xfollow = follow.x;	
	yfollow = follow.y;
	
	// zoom out as sushi gets bigger
	_sushi_scale = follow.image_xscale * 0.5;
	if (_sushi_scale < 1) _sushi_scale = 1;
}

#region debug zoom
if (debug_mode)
{
	if (keyboard_check_pressed(ord("Z")))
		zoom+=0.5;
	
	if (keyboard_check_pressed(ord("X")))
		zoom-=0.5;
		
	view_w = display_get_gui_width() * zoom * _sushi_scale;
	view_h = display_get_gui_height() * zoom * _sushi_scale;
	view_w_half = view_w * 0.5;
	view_h_half = view_h * 0.5;
	camera_set_view_size(cam, view_w, view_h);
}
#endregion

x += (xfollow - x) / xstrength;
y += (yfollow - y) / ystrength; 

x = clamp(x, view_w_half, room_width - view_w_half);
y = clamp(y, view_h_half, room_height - view_h_half);

camera_set_view_pos(cam, x - view_w_half, y - view_h_half);

// once you've reached the sushi for the first time...
if (!reached_sushi_start)
{
	// ensure follow clamps too when checking for equality...
	var _xf = clamp(follow.x, view_w_half, room_width - view_w_half);
	var _yf = clamp(follow.y, view_h_half, room_height - view_h_half);
	
	if (follow == sushi_cur() && abs(x - _xf) < 1 && abs(y - _yf) < 1)
	{
		level_start_countdown();
		xstrength = 2; // follow more rigid in the x
		ystrength = 10;
		reached_sushi_start = true;
	}
	else
	{
		// skip panning
		if (input_one_pressed())
		{
			alarm[0] = 1;
			xstrength = 1;
			ystrength = 1;
		}
	}
}

add_to_debug_map("camera: " + string(x) + ", " + string(y));
add_to_debug_map("follow: " + string(xfollow) + ", " + string(yfollow));
add_to_debug_map("strength: " + string(xstrength) + ", " + string(ystrength));