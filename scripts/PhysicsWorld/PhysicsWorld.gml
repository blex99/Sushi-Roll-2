function phys_world_set_gravity(_direction)
{
	with (oPhysicsWorld)
	{
		var _g = phys_world_gravity;
		gravity_dir = _direction;
		camera_change_dir(gravity_dir);
		rotateable_change_dir(gravity_dir);
		
		switch (_direction)
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

function phys_world_get_gravity()
{
	with (oPhysicsWorld)
	{
		return gravity_dir;
	}
}