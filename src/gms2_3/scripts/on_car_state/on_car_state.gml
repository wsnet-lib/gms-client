/// @description on_car_state(sender, array)
/// @param sender
/// @param  array
function on_car_state(argument0, argument1) {
 
	var sender = argument0;
	var state = argument1; 

	with(obj_car_remote)
	{
	    if(sender == player_id)
	    {
	        target_x = state[0];
	        target_y = state[1];
	        target_speed = state[2];
	        phy_linear_velocity_x = dcos(phy_rotation) * target_speed;
	        phy_linear_velocity_y = dsin(phy_rotation) * target_speed;
	        target_angle = state[3];
	        boosting = state[4];
	        //image_angle = direction;
	    }
	}



}
