function path_dot_create(_x, _y, _duration)
{
	var _path_dot =
	{
		life_timer_start : _duration,
		life_timer : _duration,
		alpha : 1,
		x : _x,
		y : _y,
	}
	return _path_dot;
}