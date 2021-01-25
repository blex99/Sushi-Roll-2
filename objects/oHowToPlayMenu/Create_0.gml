/// @description

event_inherited();

var _h = display_get_gui_height();
font = fnUIBig;

messages =
[
	"HOW TO PLAY",
	"Left joystick controls the Sushi's speed,",
	"but while holding A, it will rotate platforms.",
	"Press START to pause.",
	"Your objective is to reach the goal before time runs out.",
	"Good luck."
];

message_index = 0;

var _button;
var _button_width_half = button_get_width() / 2;

_button = button_create("Next", 0, _h * 0.25, -_button_width_half, _h * 0.25, how_to_play_go_to_next_slide);
ds_list_add(buttons, _button);
_button = button_create("Go to Main Menu", 0, _h * 0.25, _button_width_half, _h * 0.25, transition_start, [rMainMenu]);
ds_list_add(buttons, _button);

instance_deactivate_object(oButton);

alarm[2] = room_speed * 2;