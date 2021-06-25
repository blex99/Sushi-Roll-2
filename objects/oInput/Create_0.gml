/// @description win stats and controller detection

input_update_window_stats();

// finds the slot the device is connected to
device_index = input_seek_gamepad();
using_controller = gamepad_is_connected(device_index);
gamepad_set_axis_deadzone(0, 0.2);

var _msg = (using_controller) ? "Using Controller" : "Using Keyboard";
info_box_create(_msg, "Input");