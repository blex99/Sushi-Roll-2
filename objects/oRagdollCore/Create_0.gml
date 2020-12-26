if (!debug_mode) image_alpha = 0;

// combine this object with all rotatable things to create one large body
for (var _i = 0; _i < instance_number(pRagdoll); ++_i)
{
    var _inst = instance_find(pRagdoll, _i);
	var _xmid = ((_inst.x - x) / 2) + x;
	var _ymid = ((_inst.y - y) / 2) + y;
    physics_joint_revolute_create(id, _inst, _xmid, _ymid, 0, 0, 1, 0, 0, 0, 0);
}