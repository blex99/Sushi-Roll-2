function approach(_current, _target, _delta)
{
	if (_current < _target)
	{
	    _current += _delta;
	    if (_current > _target)
	        return _target;
	}
	else
	{
	    _current -= _delta;
	    if (_current < _target)
	        return _target;
	}
	return _current;
}

function rotate_ragdoll(_xmouse, _w_min, _w_max, _angular_spd)
{
	with (oRagdollCore)
	{
		phy_angular_velocity = (_xmouse - _w_min) / (_w_max - _w_min);
		phy_angular_velocity *= 2;
		phy_angular_velocity -= 1;
		phy_angular_velocity *= -_angular_spd; // flip sign
	}
}

// _delta = rate the ragdoll will rotate to 0 degrees
// _delta should not be more than about 4
function reset_ragdoll(_delta)
{
	with (oRagdollCore)
	{
		phy_angular_velocity = 0;
		phy_rotation = approach(phy_rotation, 0, _delta);
	}
}