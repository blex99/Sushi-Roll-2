/// @description keyboard, controller, mouse detection

if (!instance_exists(oButton)) exit;

var _len = ds_list_size(buttons);

// keyboard/controller
if (menu_control)
{
	var _vinput = round(gamepad_axis_value(global.device_index, gp_axislv));
	
	// CONTROLLER: if you've changed directions suddenly, allow reading input
	if (alarm[1] != -1 && controller_last_vinput != _vinput)
	{
		alarm[1] = -1;
		controller_last_vinput = _vinput;
	}
	
	if (keyboard_check_pressed(vk_up) || (alarm[1] == -1 && _vinput == -1))
	{
		controller_last_vinput = _vinput;
		alarm[1] = room_speed / 2; // wait to get controller input
		menu_cursor -= 1;
		if (menu_cursor < 0) menu_cursor = _len - 1;
	}
	
	if (keyboard_check_pressed(vk_down) || (alarm[1] == -1 && _vinput == 1))
	{
		controller_last_vinput = _vinput;
		alarm[1] = room_speed / 2;
		menu_cursor += 1;
		if (menu_cursor >= _len) menu_cursor = 0;
	}
	
	if (keyboard_check_pressed(vk_enter) || input_one_pressed())
	{
		menu_committed = menu_cursor;
		menu_control = false;
	}
}

var _control = menu_control;
var _cursor = menu_cursor;
var _committed = menu_committed;
var _alarm = -1;

// mouse controls
for (var i = 0; i < _len; i++)
{
	with(buttons[| i])
	{
		// override cursor and commited vars if needed
		if (_control &&
			MOUSE_GUI_X > x1 && MOUSE_GUI_X < x2 &&
			MOUSE_GUI_Y > y1 && MOUSE_GUI_Y < y2)
		{
			_cursor = i;
	
			if (MOUSE_LEFT && my_script != noone)
			{
				_committed = i;
				_control = false;
				
			}
		}
		
		if (i == _committed)	{ sub_image = BUTTON.PRESSED; _alarm = 10;	}
		else if (i == _cursor)	{ sub_image = BUTTON.HOVERING;				}
		else					{ sub_image = BUTTON.IDLE;					}
	}
}

menu_control = _control;
menu_cursor = _cursor;
menu_committed = _committed;

if (alarm[0] == -1) alarm[0] = _alarm;