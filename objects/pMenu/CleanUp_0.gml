/// @description remove buttons

var _len = ds_list_size(buttons);

for (var i = 0; i < _len; i++)
	instance_destroy(buttons[| i]);

ds_list_destroy(buttons);