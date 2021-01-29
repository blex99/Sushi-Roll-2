/// @description detect if exitting and controller

event_inherited();

// change text based on controller
if (global.using_controller)
{
	messages[4] = "...since LEFT JOYSTICK changes both.";
	messages[5] = "HOLD A to tilt the platforms.";
	messages[6] = "RELEASE A to move the sushi.";
	messages[7] = "In game, you can pause with START.";
}
else
{
	messages[4] = "...since MOUSE'S X POSITION changes both.";
	messages[5] = "HOLD LEFT MOUSE to tilt the platforms.";
	messages[6] = "RELEASE LEFT MOUSE to move the sushi.";
	messages[7] = "In game, you can pause with ESCAPE.";
}

if (input_start_pressed()) transition_start(rMainMenu);