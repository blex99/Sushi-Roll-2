/// @desc room-specific setup

view_enabled = true;
view_visible[0] = true;

target_angle = 0;

view_w = BASE_W;
view_h = BASE_H;
view_w_half = view_w * 0.5;
view_h_half = view_h * 0.5;
camera_set_view_size(CAM, view_w, view_h);

strength = strength_panning;

follow_index = 0;	// current index following
follows = [];		// array of things to follow

// at the beginning of a level, follow will go to each goal before the sushi
var _num_goals = instance_number(oGoal);
if (_num_goals > 0)
{
	for (var i = 0; i < _num_goals; i++)
		array_push(follows, instance_find(oGoal, i));
}

// add panning targets to the list of things to follow
var _num_panning_targets = instance_number(oPanningTarget);
if (_num_panning_targets > 0)
{
	for (var i = 0; i < _num_panning_targets; i++)
		array_push(follows, instance_find(oPanningTarget, i));
}

var _sushi = sushi_cur();
if (instance_exists(_sushi)) array_push(follows, _sushi);

follow_size = array_length(follows);
if (follow_size > 0)
{
	// place camera at first thing to follow
	var _following = follows[follow_index];
	x = _following.x;
	y = _following.y;
	
	// set target next follow
	alarm[0] = room_speed;
	zoom_target = 1.5;
	zoom = zoom_target;
}

