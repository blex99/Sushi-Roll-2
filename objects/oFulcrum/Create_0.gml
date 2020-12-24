var fix = physics_fixture_create();
physics_fixture_set_circle_shape(fix, 1);
physics_fixture_set_density(fix, 0); // static
physics_fixture_bind(fix, id);
physics_fixture_delete(fix);