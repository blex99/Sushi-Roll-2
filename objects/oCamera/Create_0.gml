cam = view_camera[0];
view_enabled = true;
view_visible[0] = true;

zoom = 1.5;
camera_zoom(zoom);

// follow and strength will change once game starts
follow = oGoal;
xstrength = 25;
ystrength = 25;
alarm[0] = room_speed;
reached_sushi_start = false;

// slow pan (will change once camera reaches sushi)
if (instance_exists(follow))
{
	x = follow.x;
	y = follow.y;
}

xfollow = x;
yfollow = y;