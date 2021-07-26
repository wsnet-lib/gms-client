/// @description on_color(sender, color)
/// @param sender
/// @param  color
function on_color(sender, color) 
{
	with(obj_car_remote)
	{
	    if(sender == player_id) 
	        image_blend = color;
	}
}
