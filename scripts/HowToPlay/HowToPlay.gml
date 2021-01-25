
function how_to_play_go_to_next_slide()
{
	with (oHowToPlayMenu)
	{
		alarm[2] = room_speed;
		instance_deactivate_object(oButton);
		message_index++;
		if (message_index == array_length(messages)) transition_start(rMainMenu);		
	}
}