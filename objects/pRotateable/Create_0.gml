angle_limit = 50;

var _ful = instance_create_layer(x, y, "Instances", oFulcrum);
var _rot = id;

physics_joint_revolute_create(_ful, _rot, x, y, -angle_limit,
	angle_limit, true, 0, 0, 0, 0);