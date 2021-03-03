/// @description set text of buttons to be increasing number
var _len = array_length(buttons);
for (var i = 0; i < _len; i++)
{
	if (buttons[i].object_index != oButtonBack)
		buttons[i].text = string(i + 1);
}