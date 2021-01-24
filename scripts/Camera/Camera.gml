// larger zoom, more to see
function camera_zoom(_zoom)
{
	_zoom = clamp(_zoom, 0.5, 1.5);
	
	with (oCamera)
	{
		zoom = _zoom;
		view_w = game_get_ideal_width() * _zoom;
		view_h = game_get_ideal_height() * _zoom;
		view_w_half = view_w * 0.5;
		view_h_half = view_h * 0.5;
		camera_set_view_size(cam, view_w, view_h);
	}
}