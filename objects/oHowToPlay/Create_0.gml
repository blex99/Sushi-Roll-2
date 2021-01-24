/// @description

event_inherited();

w = display_get_gui_width();
h = display_get_gui_height();
font = fnUIBig;

arr =
[
	"HOW TO PLAY",
	"Left joystick controls the Sushi's speed,",
	"but while holding A, it will rotate platforms.",
	"Press START to pause.",
	"Your objective is to reach the goal before time runs out.",
	"Good luck."
];

index = 0;

var _button = ui_create_button("Next", 0, h * 0.25, 0, h * 0.25, how_to_play_go_to_next_slide);
ds_list_add(buttons, _button);
instance_deactivate_object(oButton);
alarm[2] = room_speed * 2;