// etc vars

original_width_half = sprite_width / 2;
target_scale = 1;

torque = 100;
force = 100;

jump_buffer_start = 15;
jump_buffer = 0; // frames you cannot apply a jump impulse

// phys vars
mass = 3;
density			= 0.3;
restitution		= 0.25;
linear_damp		= 0.1; // 0.05
angular_damp	= 0.5;
fric			= 2;

my_fix			= -1; // assigned in sushi_init_fixture()

 // for animations and sfx
limit_speed = 40;
rot_360 = 0;
free_fall_buf_start = room_speed / 2;
free_fall_buf = 0;

sfx_roll = sfxRoll;
sfx_air = sfxAir;
sfx_air_inst = audio_play_sound(sfx_air, 0, true); // TODO use jukebox
audio_sound_gain(sfx_air_inst, 0, 0);

image_speed = 0;


