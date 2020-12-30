cam = view_camera[0];
view_enabled = true;
view_visible[0] = true;

zoom = 1.5;
view_w = display_get_gui_width() * zoom;
view_h = display_get_gui_height() * zoom;
camera_set_view_size(cam, view_w, view_h);
view_w_half = view_w * 0.5;
view_h_half = view_h * 0.5;

if (instance_exists(oSushiTriangle))
	follow = oSushiTriangle;
else if (instance_exists(oSushiSquare))
	follow = oSushiSquare;
else if (instance_exists(oSushiCircle))
	follow = oSushiCircle;
else
	follow = noone;

xfollow = x;
yfollow = y;

strength = 25;