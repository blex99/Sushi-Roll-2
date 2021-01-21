function game_goto_next_level(){
	
	// shouldn't be able to skip levels by mashing A
	if (oTransition.mode != TRANS_MODE.OFF) return;
	
	with (oGame)
	{
		level_index = (level_index + 1) % array_length(levels);
		transition_start(levels[level_index]);
	}
}