/// @description detect sushi

var _colliding = place_meeting(x, y, sushi_cur());

// if you're in range and you haven't set gravity yet
if (_colliding && sushi_released)
{
	sushi_cur().phy_linear_velocity_x /= 2;
	sushi_cur().phy_linear_velocity_y /= 2;
	
	phys_world_set_gravity(dir);
	sushi_released = false;
}

// if you're not in range and not allows to set gravity
if (!_colliding && !sushi_released)
{
	// allow sushi to set gravity again
	sushi_released = true;
}