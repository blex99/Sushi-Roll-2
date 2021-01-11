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

// called when the sushi is killed
function sushi_reset()
{
	with (sushi_cur())
	{
		phy_position_x = xstart;
		phy_position_y = ystart;
		phy_linear_velocity_x = 0;
		phy_linear_velocity_y = 0;
		phy_rotation = 0;
		image_alpha = 1;
		alarm[0] = invincibility_frames;
	}
}

function sushi_invincible()
{
	return sushi_cur().alarm[0] != -1;
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
			image_xscale += size_increment;
			image_yscale += size_increment;
		}
		else
		{
			image_xscale -= size_increment;
			image_yscale -= size_increment;
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
		physics_fixture_add_point(_fix, 0		 , _h * -0.5);
		physics_fixture_add_point(_fix, _w *  0.5, _h *  0.5);
		physics_fixture_add_point(_fix, _w * -0.5, _h *  0.5);
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

function sushi_jump(_velocity)
{
	with (sushi_cur())
	{
		phy_linear_velocity_y += -_velocity;
		phy_linear_velocity_y = clamp(phy_linear_velocity_y,
			-jump_velocity_max, jump_velocity_max);
	}
	
	sushi_change_size(false); // shrink
}