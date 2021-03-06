/// @description on_boost(sender, boost_id)
/// @param sender
/// @param  boost_id
function on_boost(argument0, argument1) {

	var sender = argument0; 

	with(obj_boost)
	{
	    //boost picked
	    if(argument1 == my_id)
	    {
	        charged = false;
	        if(alarm[0] <= 0)
	            alarm[0] = room_speed * 10;
	    }
	}



}
