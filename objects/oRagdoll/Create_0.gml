var _fix;
_fix = physics_fixture_create();
physics_fixture_set_circle_shape(_fix, 10);
physics_fixture_set_density(_fix, 1);
physics_fixture_bind(_fix, id);
physics_fixture_delete(_fix);

// combine this object with all rotatable things to create one large body
for (var _i = 0; _i < instance_number(oPlatform); ++_i)
{
    var _inst = instance_find(oPlatform, _i);
    physics_joint_revolute_create(id, _inst, _inst.x, _inst.y, 0, 0, 1, 0, 0, 0, 0);
}