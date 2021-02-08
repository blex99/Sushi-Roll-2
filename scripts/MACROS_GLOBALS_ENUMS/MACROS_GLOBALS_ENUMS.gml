#macro BASE_W 960
#macro BASE_H 540
#macro ROT_LIMIT 50
#macro WATERDIVISION 16 // smaller division -> more lag
#macro MOUSE_GUI_X device_mouse_x_to_gui(0)
#macro MOUSE_GUI_Y device_mouse_y_to_gui(0)
#macro MOUSE_LEFT mouse_check_button_pressed(mb_left)

#macro VALUE_RICE 10
#macro VALUE_TIME 10 // each second worth
#macro VALUE_COLLECTIBLE 100
#macro VALUE_COLLECT_EVERYTHING 1000

#macro DEBUG_START_ROOM rStartScreen

global.border_sprite = sNineSliceBoxBamboo;

// for oLevel
enum LEVEL
{
	PANNING_TO_SUSHI,
	COUNTING_DOWN,
	PLAYING,
	TIME_OUT,
	COMPLETE
}

// for oTransition
enum TRANS_MODE
{
	OFF,
	GOTO,
	INTRO
}

// for oMenu/oButton
enum BUTTON
{
	IDLE,
	HOVERING,
	PRESSED
}

gamepad_set_axis_deadzone(0, 0.2);

// finds the slot the device is connected to
global.device_index = input_seek_gamepad();

global.using_controller = gamepad_is_connected(global.device_index);
