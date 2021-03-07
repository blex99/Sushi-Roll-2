/// @description

event_inherited();

// message array
messages =
[
	"YOUR TASK is serve to sushi!",
	"YOUR MEANS is by controlling sushi...",
	"...and controlling the platforms.",
	"MOUSE'S X POSITION tilts the platforms.",
	"A and D moves the sushi.",
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

// hide button at start
instance_deactivate_object(pButton);

// display button when alarm hits
alarm[2] = room_speed * 1.5;