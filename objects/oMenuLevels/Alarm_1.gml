/// @description inherit, cursor=level not beaten

// Inherit the parent event
event_inherited();

// cursor wil point at the first not beaten level
var _len = array_length(buttons);
for (var i = 0; i < _len; i++)
{
	if (buttons[i].object_index == oButtonBack) continue;
	
	var _level = oGame.levels[difficulty][buttons[i].btag];
	if (!_level.has_beaten)
	{
		menu_cursor = buttons[i];
		break;
	}
}
