// sushi functions

// returns the object type of current sushi (triangle, square, circle, etc)
// (assumes only one sushi in level)
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

// if _grow is true, grow
// else, shrink in size
// recreate fixture
function sushi_change_size(_grow)
{
	with (sushi_cur())
	{
		if (_grow)
		{
			image_xscale *= growth_multiplier;
			image_yscale *= growth_multiplier;
		}
		else
		{
			image_xscale *= shrink_multiplier;
			image_yscale *= shrink_multiplier;
		}
		
		// don't scale outside of max or original size
		image_xscale = clamp(image_xscale, 1, scale_max);
		image_yscale = clamp(image_yscale, 1, scale_max);
		
		sushi_init_fixture();
	}
}

function sushi_init_fixture()
{
	with (sushi_cur())
	{
		if (my_fix != -1)
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