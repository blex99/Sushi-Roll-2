/// @description show that diff locked if locked

event_inherited();

if (!data_get_area_unlocked(area))
{
	my_script = noone;
	my_script_args = [];
	text = "Locked";
}