// larger zoom, more to see
function camera_update_zoom(_zoom)
{
	with (oCamera)
	{
		zoom = _zoom;
		view_w = display_get_gui_width() * _zoom;
		view_h = display_get_gui_height() * _zoom;
		view_w_half = view_w * 0.5;
		view_h_half = view_h * 0.5;
		camera_set_view_size(cam, view_w, view_h);
	}
}

function camera_increment_zoom(_amount)
{
	with (oCamera)
	{
		zoom += _amount;
		camera_update_zoom(zoom);
	}
}