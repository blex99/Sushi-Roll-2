/// @desc establish joint

rot_target = 0;
rot_strength = 10;
angle_diff = 0; 

frames_to_release_trap = room_speed;
frames_to_reset_trap = room_speed * 2;

var _ful = instance_create_layer(x, y, "Instances", oFulcrum);
joint = physics_joint_revolute_create(_ful, id, x, y, 0, 0,
	true, 0, 0, 0, 0);