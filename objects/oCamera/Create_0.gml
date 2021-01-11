cam = view_camera[0];
view_enabled = true;
view_visible[0] = true;

zoom = 1;
view_w = display_get_gui_width() * zoom;
view_h = display_get_gui_height() * zoom;
view_w_half = view_w * 0.5;
view_h_half = view_h * 0.5;
camera_set_view_size(cam, view_w, view_h);


// follow and strength will change once game starts
follow = oGoal;
xstrength = 25;
ystrength = 25;
alarm[0] = 15;
reached_sushi_start = false;

// slow pan (will change once camera reaches sushi)
if (instance_exists(follow))
{
	x = follow.x;
	y = follow.y;
}

xfollow = x;
yfollow = y;