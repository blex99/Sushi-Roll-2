angle_limit = 50;
radius = sprite_width * 0.6;

active = false;
in_range = false;

xcenter = (bbox_right + bbox_left) * 0.5;
ycenter = (bbox_top + bbox_bottom) * 0.5;

var _ful = instance_create_layer(x, y, "Instances", oFulcrum);
var _rot = id;

physics_joint_revolute_create(_ful, _rot, x, y, -angle_limit,
	angle_limit, true, 0, 0, 0, 0);