/// @description Insert description here
// control the sushi x velocity
if (!input_one())
{
	phy_linear_velocity_x += input_x_axis() * move_force;
}