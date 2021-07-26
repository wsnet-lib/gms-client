/// @description on_laps(sender, laps)
/// @param sender
/// @param  laps
function on_laps(sender, _laps) 
{


	with(obj_car_remote)
	{
	    if(sender == player_id)
	    {
	        laps = _laps;
	        if(laps >= 4)
	        {
	            arrived = true;
	        }
	    }
	}



}
