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

function rotate_ragdoll(_target_angle, _angular_spd_mult)
{

}

// _delta = rate the ragdoll will rotate to 0 degrees
// _delta should not be more than about 4
function reset_ragdoll(_delta)
{

}