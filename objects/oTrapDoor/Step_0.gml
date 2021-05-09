/// @description trap door state calls

if (level_is_state(LEVEL.PAUSED)) exit;

if (move_timer != -1)
{
	move_timer--;
}

script_execute(state);