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

// called in RoomStart and Create
function camera_init()
{
	with (oCamera)
	{
		view_enabled = true;
		view_visible[0] = true;

		view_w = BASE_W;
		view_h = BASE_H;
		view_w_half = view_w * 0.5;
		view_h_half = view_h * 0.5;
		camera_set_view_size(CAM, view_w, view_h);

		xfollow = 0;
		yfollow = 0;

		target_angle = 0;
		
		// shake vars
		shake = false;
		shake_time = 0;
		shake_magnitude = 0;
		shake_fade = 0;

		zoom_target = 1.5;
		zoom = zoom_target;

		my_path_speed = 14;
		my_path = -1;
		if (instance_exists(oLevelManager))
		{
			if (path_exists(oLevelManager.camera_path))
			{
				my_path = path_duplicate(oLevelManager.camera_path);
				path_start(my_path, 0, path_action_stop, true);
				alarm[0] = room_speed; // how many frames to stare at goal
			}
			else
			{
				// in the advent i forget to assign a path
				var _sushi = sushi_cur();
				x = _sushi.x;
				y = _sushi.y;
				level_start_countdown();
				print("Error: you forgot to assign a path to the level.");
			}
		}
	}
}

// _time       The length of time - in steps - to shake the screen
// _magnitude  The amount of screenshake to apply
// _fade       How quickly the screenshake effect will fade out
// source: https://www.yoyogames.com/en/blog/coffee-break-tutorials-juicy-screenshake-gml
function camera_shake(_time, _magnitude, _fade)
{
	with (oCamera)
	{
		shake = true;
		shake_time = _time;
		shake_magnitude = _magnitude;
		shake_fade = _fade;
	}
}

















