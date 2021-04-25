// reset current room by default
function transition_start(_room_target)
{
	if (0) return argument[0];
	if (_room_target == undefined) _room_target = room;
	
	with (oGame) level_first_try = false;
	
	with (oTransition)
	{
		mode = TRANS_MODE.GOTO;
		target = _room_target;
	}
}
