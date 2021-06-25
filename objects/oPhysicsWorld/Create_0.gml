phys_world_gravity_strength = 60;
gravity_card_dir = DIR.D;
physics_paused = false;
pix_to_meter_scale = 0.1;

physics_pause_enable(physics_paused);
physics_world_create(pix_to_meter_scale);
physics_world_gravity(0, phys_world_gravity_strength);
physics_world_update_speed(room_speed * 2);
physics_world_update_iterations(30);
if (global.debug.show_debug) physics_world_draw_debug(-1);