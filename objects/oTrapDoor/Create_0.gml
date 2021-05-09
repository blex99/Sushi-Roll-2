/// @desc establish joint

rot_strength = 10;

move_timer_start = room_speed;
move_timer = 0;

state = s_trap_idle;

var _ful = instance_create_layer(x, y, "Instances", oFulcrum);
joint = physics_joint_revolute_create(_ful, id, x, y, 0, 0,
	true, 0, 0, 0, 0);