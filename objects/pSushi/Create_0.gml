// etc vars

original_width_half = sprite_width / 2;
scale_max = 2.5;
size_increment = 0.5;
target_scale = 1;

torque = 100;
force = 100;

rot_360 = 0;

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

limit_speed = 40; // for animations and sfx

free_fall_buf_start = room_speed / 2;
free_fall_buf = 0;

sfx_roll = sfxRoll;
sfx_air = sfxAir;
sfx_air_inst = audio_play_sound(sfx_air, 0, true);
audio_sound_gain(sfx_air_inst, 0, 0);

image_speed = 0;


