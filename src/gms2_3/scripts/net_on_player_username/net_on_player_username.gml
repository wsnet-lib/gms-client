/// @description net_on_player_username(success, player)
/// @param success
/// @param  player
function net_on_player_username(argument0, argument1) {

	if(argument0)
	{
	    var player_id = argument1[0];
	    var player_name = argument1[1];
    
	    show_debug_message("player changed name " + player_name + "["+string(player_id)+"]");
	}
	else
	{
	    show_debug_message("Error, can't change allow join: " + net_decode_error(global.net_error_id));
	}



}
