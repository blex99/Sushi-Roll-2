// etc vars
scale_max = 2;
size_increment = 0.2;
invincibility_frames = room_speed * 3;

torque = 50;
force = 100;
alarm[0] = invincibility_frames;

// phys vars
mass_start = 3;
mass = mass_start;
mass_increment = 0.05;

density			= 0.3;
restitution		= 0.25;
linear_damp		= 0.05;
angular_damp	= 0.5;
fric			= 2;

my_fix			= -1; // assigned in sushi_init_fixture()

my_previous_x = x;
my_previous_y = y;
time_to_detect = 2;
alarm[1] = room_speed * time_to_detect;