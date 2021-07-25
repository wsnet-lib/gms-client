/// @description net_on_player_leave(player)
/// @param player
function net_on_player_leave(player) 
{
	var _player_id = player[0];
	var player_name = player[1];

	show_debug_message("player left " + player_name + "["+string(_player_id)+"]");
	with(obj_car_remote)
	{
	    if(player_id == _player_id)
	        instance_destroy();
	}
}