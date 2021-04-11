// etc vars

original_width_half = sprite_width / 2;
scale_max = 2.5;
size_increment = 0.5;
target_scale = 1;

torque = 100;
force = 100;

jump_buffer_start = 15;
jump_buffer = 0; // frames you cannot apply a jump impulse

// phys vars
mass_start = 3;
mass = mass_start;
mass_increment = 0.05;

density			= 0.3;
restitution		= 0.25;
linear_damp		= 0.1; // 0.05
angular_damp	= 0.5;
fric			= 2;

my_fix			= -1; // assigned in sushi_init_fixture()

my_previous_x = x;
my_previous_y = y;
time_to_detect = 2;
alarm[1] = room_speed * time_to_detect;