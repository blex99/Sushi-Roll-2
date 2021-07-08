/// @description show that diff locked if locked

event_inherited();

if (!oSaveData.area_unlocked[area])
{
	my_script = noone;
	my_script_args = [];
	text = "Locked";
}