if (instance_exists(follow))
{
	xfollow = follow.x;	
	yfollow = follow.y;	
}

if (keyboard_check_pressed(ord("Z")))
	zoom+=0.5;
	
if (keyboard_check_pressed(ord("X")))
	zoom-=0.5;

view_w = display_get_gui_width() * zoom;
view_h = display_get_gui_height() * zoom;
view_w_half = view_w * 0.5;
view_h_half = view_h * 0.5;
camera_set_view_size(cam, view_w, view_h);

x += (xfollow - x) / strength;
y += (yfollow - y) / strength;

x = clamp(x, view_w_half, room_width - view_w_half);
y = clamp(y, view_h_half, room_height - view_h_half);

camera_set_view_pos(cam, x - view_w_half, y - view_h_half);