var _flag;

physics_world_create(0.1);
physics_world_gravity(0, 20);
physics_world_update_speed(room_speed * 2);
physics_world_update_iterations(30);
_flag = phy_debug_render_joints | phy_debug_render_coms;
physics_world_draw_debug(_flag);