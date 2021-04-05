function phys_world_set_gravity(_card_dir)
{
	with (oPhysicsWorld)
	{
		gravity_card_dir = _card_dir;
		camera_set_deg(_card_dir);
		rotateable_update_limits(camera_get_deg());
		
		var _g = phys_world_gravity_strength;
		switch (_card_dir)
		{
			case DIR.L:
				physics_world_gravity(-_g, 0);
				break;
			case DIR.U:
				physics_world_gravity(0, -_g);
				break;
			case DIR.R:
				physics_world_gravity(_g, 0);
				break;
			case DIR.D:
				physics_world_gravity(0, _g);
				break;
		}
	}
}