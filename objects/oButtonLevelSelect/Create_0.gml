/// @description show that diff locked if locked

event_inherited();

if (!oGame.diff_unlocked[difficulty])
{
	my_script = noone;
	my_script_args = [];
	text = "Locked";
}