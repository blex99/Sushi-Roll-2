// change angle of cam based on gravity direction
function camera_change_dir(_dir)
{
	with (oCamera)
	{
		target_angle = (DIR.D - _dir) * 90;
	}
}