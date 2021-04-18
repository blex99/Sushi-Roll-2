/// @description show that diff locked if locked

event_inherited();

if (!oGame.area_unlocked[area])
{
	my_script = noone;
	my_script_args = [];
	text = "Locked";
}