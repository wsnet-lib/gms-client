/// @description net_on_player_leave(player)
/// @param player
function net_on_player_leave(argument0) {
	var _player_id = argument0[0];
	var player_name = argument0[1];

	show_debug_message("player left " + player_name + "["+string(_player_id)+"]");
	with(obj_car_remote)
	{
	    if(player_id ==_player_id)
	        instance_destroy();
	}



}
