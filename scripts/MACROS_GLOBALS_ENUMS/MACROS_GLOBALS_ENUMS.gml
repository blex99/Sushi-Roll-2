#macro BASE_W 960
#macro BASE_H 540
#macro ROT_LIMIT 50
#macro WATERDIVISION 16 // smaller division -> more lag
#macro mouse_gui_x device_mouse_x_to_gui(0)
#macro mouse_gui_y device_mouse_y_to_gui(0)
#macro mouse_left mouse_check_button_pressed(mb_left)

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
global.device_index = 0;

for (var _i = 0; _i < gamepad_get_device_count(); _i++;)
{
	if (gamepad_is_connected(_i))
	{
		global.device_index = _i;
		break;
	}
}

global.using_controller = true;