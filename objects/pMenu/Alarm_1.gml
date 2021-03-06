///@ init button array

var _len = instance_number(pButton);
var _btag = 0;
for (var i = 0; i < _len; i++)
{
	for (var j = 0; j < _len; j++)
	{
		var b = instance_find(pButton, j);
		if (b.btag == _btag)
		{
			buttons[i] = b;
			_btag++;
			break;
		}
	}
}
menu_cursor = buttons[0];