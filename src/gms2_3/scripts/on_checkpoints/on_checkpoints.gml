/// @description on_checkpoints(sender, checkpoints)
/// @param sender
/// @param  checkpoints
function on_checkpoints(argument0, argument1) {

	var sender = argument0; 

	with(obj_car_remote)
	{
	    if(sender == player_id)
	    {
	        checkpoints = argument1;
	    }
	}
  
	sort_cars();



}
