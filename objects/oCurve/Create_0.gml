/// @description setup phys shape

radius = sprite_width;
height = sprite_height;

var _fix = physics_fixture_create();
physics_fixture_set_chain_shape(_fix, true);

for (var i = 270; i >= 180; i--)
{
	var _x = lengthdir_x(radius, i);
	var _y = lengthdir_y(radius, i);
	
	physics_fixture_add_point(_fix, radius + _x, _y);
}

physics_fixture_add_point(_fix, 0, height);

physics_fixture_set_density(_fix, 0);
physics_fixture_set_restitution(_fix, 0.2);
physics_fixture_set_linear_damping(_fix, 0.2);
physics_fixture_set_angular_damping(_fix, 0.2);
physics_fixture_set_friction(_fix, 0.2);

physics_fixture_bind(_fix, id);
physics_fixture_delete(_fix);