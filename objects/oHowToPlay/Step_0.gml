/// @description moves to next screen

if (input_one_pressed())
{
	index++;
	if (index == array_length(arr)) transition_start(rLevel01);	
}