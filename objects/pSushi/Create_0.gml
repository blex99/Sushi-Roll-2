// etc vars

image_speed = 0;

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
sushi_cur_speed = 0;
sushi_speeds = ds_list_create();
sushi_speeds_len = 0;
limit_speed = 40;
rot_360 = 0;
free_fall_buf_start = room_speed / 2;
free_fall_buf = 0;

played_splash = false;
touching_gravity_mod = false;

sfx_roll = sfxRoll;
sfx_bonk = sfxBonk;
sfx_air = sfxAir;
sfx_splash = sfxSplash;
sfx_air_inst = jukebox_play_sfx(sfx_air, true, 1);
jukebox_set_sfx_volume_mult(sfx_air_inst, 0, 0);

sfx_bubbling = sfxBubblingLoop;
sfx_bubbling_inst = jukebox_play_sfx(sfx_bubbling, true, 1);
jukebox_set_sfx_volume_mult(sfx_bubbling_inst, 0, 0);
