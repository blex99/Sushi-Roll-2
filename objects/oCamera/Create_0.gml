/// @desc setup

view_enabled = true;
view_visible[0] = true;

view_w = BASE_W;
view_h = BASE_H;
view_w_half = view_w * 0.5;
view_h_half = view_h * 0.5;
camera_set_view_size(CAM, view_w, view_h);



// strength range: 0 < x <= 1, 1 being strongest
strength_panning = 1 / 50;
strength_playing = 1 / 3;

xfollow = 0;
yfollow = 0;