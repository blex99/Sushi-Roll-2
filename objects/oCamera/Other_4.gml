/// @desc room-specific setup

view_enabled = true;
view_visible[0] = true;
cam = view_camera[0];
zoom = 1;

// follow and strength will change once game starts
follow = oGoal;
strength = 1 / 30; // range: 0 < x <= 1, 1 being strongest
reached_sushi_start = false; // if camera reached the sushi

if (instance_exists(follow))
{
	alarm[0] = room_speed; // set target to sushi
	x = follow.x;
	y = follow.y;
	zoom = 1.5;
}

xfollow = x;
yfollow = y;

camera_zoom(zoom);