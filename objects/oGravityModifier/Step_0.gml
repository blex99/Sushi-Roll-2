/// @description detect sushi

var _colliding = place_meeting(x, y, sushi_cur());

// if you're in range and you haven't set gravity yet
if (_colliding && sushi_released)
{
	phys_world_reverse_gravity();
	sushi_released = false;
}

// if you're not in range and not allows to set gravity
if (!_colliding && !sushi_released)
{
	// allow sushi to set gravity again
	sushi_released = true;
}