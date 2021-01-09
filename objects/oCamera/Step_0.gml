var _sushi_scale = 1;

if (instance_exists(follow))
{
	xfollow = follow.x;	
	yfollow = follow.y;	
	_sushi_scale = follow.image_xscale * 0.25;
	if (_sushi_scale < 1) _sushi_scale = 1;
}

if (debug_mode)
{
	if (keyboard_check_pressed(ord("Z")))
		zoom+=0.5;
	
	if (keyboard_check_pressed(ord("X")))
		zoom-=0.5;
}

view_w = display_get_gui_width() * zoom * _sushi_scale;
view_h = display_get_gui_height() * zoom * _sushi_scale;
view_w_half = view_w * 0.5;
view_h_half = view_h * 0.5;
camera_set_view_size(cam, view_w, view_h);

x += (xfollow - x) / xstrength;
y += (yfollow - y) / ystrength; 

x = clamp(x, view_w_half, room_width - view_w_half);
y = clamp(y, view_h_half, room_height - view_h_half);

camera_set_view_pos(cam, x - view_w_half, y - view_h_half);