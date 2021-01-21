#macro RES_W 960
#macro RES_H 540
#macro ROT_LIMIT 50
#macro WATERDIVISION 16 // smaller division -> more lag

// for oTransition
enum TRANS_MODE
{
	OFF,
	GOTO,
	INTRO
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