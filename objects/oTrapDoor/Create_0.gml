/// @desc establish joint

is_down = false;

rot_target = 0;
rot_strength = 10;
angle_diff = 0; 

move_timer_start = room_speed;
move_timer = 0;

state = trap_door_state_idle;

var _ful = instance_create_layer(x, y, "Instances", oFulcrum);
joint = physics_joint_revolute_create(_ful, id, x, y, 0, 0,
	true, 0, 0, 0, 0);