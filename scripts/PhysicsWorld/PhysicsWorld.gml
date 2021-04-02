function phys_world_reverse_gravity()
{
	with (oPhysicsWorld)
	{
		phys_world_gravity *= -1;
		physics_world_gravity(0, phys_world_gravity);
	}
}