/// @description on_boost(sender, boost_id)
/// @param sender
/// @param  boost_id
function on_boost(sender, boost_id)
{
	with(obj_boost)
	{
	    //boost picked
	    if(boost_id == my_id)
	    {
	        charged = false;
	        if(alarm[0] <= 0)
	            alarm[0] = room_speed * 10;
	    }
	}
}
