/// @description on_color(sender, color)
/// @param sender
/// @param  color
function on_color(argument0, argument1) {
 
	var sender = argument0;

	with(obj_car_remote)
	{
	    if(sender == player_id) 
	        image_blend = argument1;
	}



}
