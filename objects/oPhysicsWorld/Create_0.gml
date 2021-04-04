phys_world_gravity = 60;
gravity_dir = DIR.D;
physics_pause_enable(false);
physics_world_create(0.1);
physics_world_gravity(0, phys_world_gravity);
physics_world_update_speed(room_speed * 2);
physics_world_update_iterations(30);
if (debug_mode) physics_world_draw_debug(-1);

physics_paused = false;