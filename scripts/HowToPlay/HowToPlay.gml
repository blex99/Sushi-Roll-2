
function how_to_play_go_to_next_slide()
{
	with (oHowToPlay)
	{
		alarm[2] = room_speed;
		instance_deactivate_object(oButton);
		index++;
		if (index == array_length(arr)) transition_start(rMainMenu);		
	}
}