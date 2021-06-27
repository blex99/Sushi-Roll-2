/// @description set width and height vars

// NOTE: for variable dir, its [up, down, left, right]

button_font = fnUI;

var _w_half = sprite_width / 2;
var _h_half = sprite_height / 2;
x1 = x - _w_half; // right
x2 = x + _w_half; // left
y1 = y - _h_half; // top
y2 = y + _h_half; // bottom
xcenter = (bbox_right + bbox_left) / 2;
ycenter = (bbox_bottom + bbox_top) / 2;

hovering_target_scale = 1.1;
button_state = BUTTON.IDLE;
image_speed = 0;