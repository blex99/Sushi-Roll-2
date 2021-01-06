// etc vars
scale_max = 2;
growth_multiplier = 1.1;
shrink_multiplier = 0.9;
jump_buffer_start = 1; // frames till you can try to jump again
jump_buffer = jump_buffer_start;
jump_velocity_max = 500;

// phys vars
density			= 0.2;
restitution		= 0.1;
linear_damp		= 0.2;
angular_damp	= 0.2;
fric			= 0.25;

my_fix			= -1; // assigned in sushi_init_fixture()