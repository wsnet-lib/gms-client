/// @description net_on_player_kickban(success, player, banned) 
/// @param success
/// @param player
/// @param banned
function net_on_player_kickban(success, player, banned)
{
	if(success)
	{
	    var player_id = player[0];
	    var player_name = player[1];
    
	    //0 = kick, 1 = ban
	    if(banned)
	        show_debug_message("Player banned: " + player_name + "["+string(player_id)+"]");
		else
	        show_debug_message("Player kicked: " + player_name + "["+string(player_id)+"]");
	}
	else
	{
	    show_debug_message("Error, can't kickban: " + net_decode_error(global.net_error_id));
	}
}
