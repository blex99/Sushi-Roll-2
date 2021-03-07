/// @description detect if exitting and controller

event_inherited();

// change text based on controller
if (global.using_controller)
{
	messages =
	[
		"YOUR TASK is serve to sushi!",
		"YOUR MEANS is by controlling sushi...",
		"...and controlling the platforms.",
		"RIGHT JOYSTICK tilts the platforms.",
		"LEFT JOYSTICK moves the sushi.",
		"In game, you can pause with START.",
		"Good luck."
	];
}
else
{
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
}

if (input_back_pressed()) transition_start(rMenuMain);