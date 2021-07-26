/// @description on_checkpoints(sender, checkpoints)
/// @param sender
/// @param  checkpoints
function on_checkpoints(sender, _checkpoints) 
{ 
	with(obj_car_remote)
	{
	    if(sender == player_id)
	    {
	        checkpoints = _checkpoints;
	    }
	}
	sort_cars();
}
