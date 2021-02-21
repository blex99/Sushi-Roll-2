/// @description open trap soon

if (angle_diff < 1 && rot_target == 0 &&
	alarm[0] == -1 && alarm[1] == -1)
{
	alarm[0] = frames_to_release_trap;
}