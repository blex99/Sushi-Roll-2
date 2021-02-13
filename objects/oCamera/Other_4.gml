/// @desc room-specific setup

view_enabled = true;
view_visible[0] = true;
cam = view_camera[0];
zoom = 1;
strength = 1 / 30;	// range: 0 < x <= 1, 1 being strongest
follow_index = 0;	// current index following
follows = [];		// array of things to follow

// at the beginning of a level, follow will go to each goal before the sushi
var _num_goals = instance_number(oGoal);
if (_num_goals > 0)
{
	for (var i = 0; i < _num_goals; i++)
		array_push(follows, instance_find(oGoal, i));
}

var _sushi = sushi_cur();
if (instance_exists(_sushi)) array_push(follows, _sushi);

follow_size = array_length(follows);
if (follow_size > 0)
{
	var _following = follows[follow_index];
	alarm[0] = room_speed; // set target next follow
	zoom = 1.5;
	
	x = _following.x;
	y = _following.y;
	xfollow = _following.x;
	yfollow = _following.y;
}

camera_zoom(zoom);