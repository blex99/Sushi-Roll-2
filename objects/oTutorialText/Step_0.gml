/// @description Insert description here
// You can write your code in this editor

x = sushi_ref.x;
y = sushi_ref.y;

if (global.using_controller)
{
	text =
	[
		"Move with Left Joystick",
		"Rotate platforms Right Joystick"
	];
}
else
{
	text =
	[
		"Move with A and D",
		"Rotate platforms with the mouse"
	];
}

if (text_i == 0 && level_is_state(LEVEL.PLAYING) && input_move_sushi())
{
	text_i = 1;
	alarm[0] = room_speed * 3;
}