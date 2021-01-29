/// @description

event_inherited();

// message array
messages =
[
	"YOUR TASK is serve sushi!",
	"YOUR MEANS is by controlling sushi...",
	"...and controlling the platforms.",
	"Get used to swapping between these two moves...",
	"...since MOUSE'S X POSITION changes both.",
	"HOLD LEFT MOUSE to tilt the platforms.",
	"RELEASE LEFT MOUSE to move the sushi.",
	"In game, you can pause with ESCAPE.",
	"Good luck."
];
message_index = 0;
messages_length = array_length(messages);

font = fnUIBig;
box_sprite = global.border_sprite;
vbuffer = font_get_size(font);

var _max_width_pix = 0;
draw_set_font(font);
for (var i = 0; i < messages_length; i++)
	_max_width_pix = max(_max_width_pix, string_width(messages[i]));

box_width_half  = _max_width_pix * 0.5;
box_height_half = vbuffer * (messages_length) / 2;

// create button
var _h = display_get_gui_height();
var _button = button_create("Next", 0, _h * 0.5, 0, box_height_half, how_to_play_go_to_next_slide);
ds_list_add(buttons, _button);
instance_deactivate_object(oButton);

// display button when alarm hits
alarm[2] = room_speed * 1.5;