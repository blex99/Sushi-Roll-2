/// @description display buttons

if (message_index == array_length(messages) - 1)
{
	var _button_num = ds_list_size(buttons);
	var _last_button = buttons[| _button_num - 1];
	instance_activate_object(_last_button);
	_last_button.xtarget = 0;
}
else
{
	instance_activate_object(oButton);	
}

button_reset_positions();