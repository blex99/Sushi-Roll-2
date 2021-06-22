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
		
		// force mass to increase differently than default
		// (to prevent being super slow)
		physics_mass_properties(mass, 0, 0, phy_inertia);
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

// returns true if the sushi is touching the ground
function sushi_is_grounded()
{
	// for detecting if grounded
	var _buf = original_width_half * target_scale + 4;
	var _down_angle = camera_get_deg() - 90;
	
	var _x1 = phy_position_x;
	var _y1 = phy_position_y;
	var _x2 = _x1 - lengthdir_x(_buf, _down_angle);
	var _y2 = _y1 + lengthdir_y(_buf, _down_angle);
	
	return collision_line(_x1, _y1, _x2, _y2, pPhysicsEntity, 0, 1);
}

function sushi_jump(_newtons, _angle)
{
	var _sushi = sushi_cur();
	if (_sushi.jump_buffer > 0) return; // can only jump when jump buffer == 0
	
	with (_sushi)
	{
		jump_buffer = jump_buffer_start;
	
		// the direction of the impluse of the spring is 
		// relative to its image angle
		
		// by default is 0 (if you haven't rotated the spring
		var _impluse_card_dir	= deg2card(_angle);
		var _impluse_deg		= _angle;
		
		// resetting the velocity of the same direction
		// we're applying a force to ensure percise jump heights
		if (_impluse_card_dir == DIR.U || _impluse_card_dir == DIR.D)
			phy_linear_velocity_y = 0;
		else
			phy_linear_velocity_x = 0;
		
		// get x, y, components of gravity dir...
		var _imp_x = lengthdir_x(_newtons, _impluse_deg);
		var _imp_y = lengthdir_y(_newtons, _impluse_deg);
		
		physics_apply_impulse(phy_position_x, phy_position_y, _imp_x, _imp_y);
	}	
}

// return the resultant speed (divided by 10)
function sushi_get_speed()
{
	with (sushi_cur())
	{
		var _asqrd = sqr(phy_linear_velocity_x);
		var _bsqrd = sqr(phy_linear_velocity_y);
		return round(sqrt(_asqrd + _bsqrd) / 10);
	}
}

// spawns a knife at sushi's position
function sushi_die()
{
	if (level_is_state(LEVEL.PAUSED)) level_toggle_pause();
	
	var _knife;
	with (sushi_cur())
	{
		_knife = instance_create_layer(x, y, "Instances", oKnife);
		phy_linear_velocity_x = 0;
		phy_linear_velocity_y = 0;
	}
	
	_knife.y -= _knife.sprite_height / 2;
}

/*
// if _grow is true, grow
// else, shrink in size
// recreate fixture
function sushi_change_size(_grow)
{
	with (sushi_cur())
	{
		if (_grow)
		{
			target_scale += size_increment;
			target_scale += size_increment;
			
			mass += mass_increment;
		}
		else
		{
			// shink to original size
			target_scale -= size_increment;
			target_scale -= size_increment;
			
			mass = mass_start;
		}
		
		// don't scale outside of max or original size
		target_scale = clamp(target_scale, 1, scale_max);
		target_scale = clamp(target_scale, 1, scale_max);
		
		sushi_init_fixture();
	}
}

// returns size of normalized (0...1) of sushi
function sushi_get_size_normalized()
{
	var _max_rice_consume = 1;
	var _cur_rice_consume = 1;
	
	with (sushi_cur())
	{
		_max_rice_consume = (scale_max - 1) /  size_increment;
		_cur_rice_consume = (target_scale - 1) /  size_increment;
	}
	
	return _cur_rice_consume / _max_rice_consume;
}
*/