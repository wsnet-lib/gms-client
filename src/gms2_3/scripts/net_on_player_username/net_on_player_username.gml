/// @description net_on_player_username(success, player)
/// @param success
/// @param  player
function net_on_player_username(success, player) 
{
	if(success)
	{
	    var player_id = player[0];
	    var player_name = player[1];
    
	    show_debug_message("player changed name " + player_name + "["+string(player_id)+"]");
	}
	else
	{
	    show_debug_message("Error, can't change allow join: " + net_decode_error(global.net_error_id));
	}
}