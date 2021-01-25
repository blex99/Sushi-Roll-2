function transition_start(_room_target)
{
	with (oGame) level_first_try = false;
	
	with (oTransition)
	{
		mode = TRANS_MODE.GOTO;
		target = _room_target;
	}
}