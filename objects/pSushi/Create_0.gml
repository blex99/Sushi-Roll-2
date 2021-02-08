// etc vars
scale_max = 2;
size_increment = 0.2;
jump_velocity_max = 500;
invincibility_frames = room_speed * 3;

force = 0;
force_normal = 2;
force_bonus = 4;
force_max = 4;

alarm[0] = invincibility_frames;

// phys vars
mass = 2.5;
density			= 0.25;
restitution		= 0.25;
linear_damp		= 0.1;
angular_damp	= 0.5;
fric			= 1;

my_fix			= -1; // assigned in sushi_init_fixture()

my_previous_x = x;
my_previous_y = y;
time_to_detect = 2;
alarm[1] = room_speed * time_to_detect;