#macro BASE_W 960
#macro BASE_H 540
#macro WATERDIVISION 16 // smaller division -> more lag
#macro MOUSE_GUI_X device_mouse_x_to_gui(0)
#macro MOUSE_GUI_Y device_mouse_y_to_gui(0)
#macro MOUSE_LEFT mouse_check_button_pressed(mb_left)
#macro CAM view_camera[0]

#macro VALUE_RICE				50
#macro VALUE_COLLECTIBLE		250
#macro VALUE_COLLECTOR_BONUS	500
#macro VALUE_SPEEDY_BONUS		500

#macro START_FULLSCREEN false
#macro DEBUG_START_ROOM rSplashScreen//rSplashScreen
#macro SHOW_DEBUG_DEFAULT false

global.border_sprite = sNineSliceBoxBamboo;

enum LEVEL_DIFF
{
	BEGINNER,
	INTERMEDIATE,
	EXPERT,
	COUNT // = 3, the size of the enum
}

// for oLevel
enum LEVEL
{
	PANNING,
	COUNTING_DOWN,
	PLAYING,
	PAUSED,
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
