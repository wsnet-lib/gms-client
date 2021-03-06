/// @description on_laps(sender, laps)
/// @param sender
/// @param  laps
function on_laps(argument0, argument1) {

	var sender = argument0; 

	with(obj_car_remote)
	{
	    if(sender == player_id)
	    {
	        laps = argument1;
	        if(laps >= 4)
	        {
	            arrived = true;
	        }
	    }
	}



}
