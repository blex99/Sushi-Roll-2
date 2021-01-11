// etc vars
scale_max = 2;
size_increment = 0.2;
jump_velocity_max = 500;
invincibility_frames = room_speed * 3;
move_force = 1.5;
alarm[0] = invincibility_frames;

// phys vars
density			= 0.2;
restitution		= 0.1;
linear_damp		= 0.1;
angular_damp	= 0.1;
fric			= 0.15;

my_fix			= -1; // assigned in sushi_init_fixture()