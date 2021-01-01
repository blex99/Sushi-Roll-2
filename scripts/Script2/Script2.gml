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

// returns the object type of current sushi (triangle, square, triangle, etc)
function sushi_cur()
{
	if (instance_exists(oSushiTriangle))
		return oSushiTriangle;
	else if (instance_exists(oSushiSquare))
		return oSushiSquare;
	else if (instance_exists(oSushiCircle))
		return oSushiCircle;
	else
		return noone;
}

function physics_fixture_set_sushi_shape(_fix)
{
	var _sushi = sushi_cur();
	var _w = _sushi.sprite_width
	var _h = _sushi.sprite_height;

	if (_sushi == oSushiTriangle)
	{
		physics_fixture_set_polygon_shape(_fix);
		physics_fixture_add_point(_fix, 0, 0);
		physics_fixture_add_point(_fix, _w, _h);
		physics_fixture_add_point(_fix, 0, _h);
	}
	else if (_sushi == oSushiSquare)
	{
		physics_fixture_set_box_shape(_fix, _w * 0.5, _h * 0.5);
	}
	else // circle
	{
		physics_fixture_set_circle_shape(_fix, _w * 0.5);
	}
}

function sushi_init_fixture(_remove_fix)
{
	with (sushi_cur())
	{
		if (_remove_fix)
			physics_remove_fixture(id, my_fix);
		
		var _fix = physics_fixture_create();

		physics_fixture_set_sushi_shape(_fix);

		physics_fixture_set_density(_fix, density);
		physics_fixture_set_restitution(_fix, restitution);
		physics_fixture_set_linear_damping(_fix, linear_damp);
		physics_fixture_set_angular_damping(_fix, angular_damp);
		physics_fixture_set_friction(_fix, fric);
		my_fix = physics_fixture_bind(_fix, id);
		physics_fixture_delete(_fix);
	}
}

function sushi_grow()
{
	with (sushi_cur())
	{
		image_xscale *= 1.1;
		image_yscale *= 1.1;
		sushi_init_fixture(true);
	}
}











