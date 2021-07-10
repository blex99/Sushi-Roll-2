/// @desc create fixture and set scale targets

sfx_spring = sfxSpring;
xscale_target = 1;

var _fix = physics_fixture_create();
physics_fixture_set_box_shape(_fix, sprite_width / 2, 1);

physics_fixture_bind_ext(_fix, id, 0, -3);
physics_set_density(_fix, 0);

physics_fixture_delete(_fix);