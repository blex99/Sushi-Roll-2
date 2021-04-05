// change angle of cam based on gravity direction
function camera_set_deg(_dir)
{
	with (oCamera) target_angle = card2deg(DIR.D - _dir);
}

// get TARGET degrees of camera
// by default, its 0
function camera_get_deg()
{
	with (oCamera) return target_angle;
}