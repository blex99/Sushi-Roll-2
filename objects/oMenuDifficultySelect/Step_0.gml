/// @description menu controls

if (!instance_exists(pButton)) exit;

var _len = array_length(buttons);

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
		alarm[1] = room_speed / 2;
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
	
	if (keyboard_check_pressed(vk_enter) || gamepad_button_check(global.device_index, gp_face1))
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
	with(buttons[i])
	{
		// override cursor and commited vars if needed
		if (_control && !global.using_controller &&
			MOUSE_GUI_X > x - w_half && MOUSE_GUI_X < x + w_half &&
			MOUSE_GUI_Y > y - h_half && MOUSE_GUI_Y < y + h_half)
		{
			_cursor = i;
			if (MOUSE_LEFT && !global.using_controller)
			{
				_committed = i;
				_control = false;
			}
		}

		if (i == _committed)
		{
			sub_image = BUTTON.PRESSED;
			_alarm = 10;
			image_xscale = 1;
			image_yscale = 1;
		}
		else if (i == _cursor)
		{
			sub_image = BUTTON.HOVERING;
			image_xscale = 1.1;
			image_yscale = 1.1;
		}
		else
		{
			sub_image = BUTTON.IDLE;
			image_xscale = 1;
			image_yscale = 1;
		}
	}
}

menu_control = _control;
menu_cursor = _cursor;
menu_committed = _committed;

if (alarm[0] == -1) alarm[0] = _alarm;