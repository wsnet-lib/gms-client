/// @description net_on_player_kicked(success, player, kick_or_ban) 
/// @param success
/// @param  player
/// @param  kick_or_ban
function net_on_player_kickban(argument0, argument1, argument2) {

	if(argument0)
	{
	    var player_id = argument1[0];
	    var player_name = argument1[1];
    
	    //0 = kick, 1 = ban
	    var banned = argument2;
	    var kicked = !argument2;
    
	    if(kicked)
	        show_debug_message("Player kicked: " + player_name + "["+string(player_id)+"]");
	    else
	        show_debug_message("Player banned: " + player_name + "["+string(player_id)+"]");
	}
	else
	{
	    show_debug_message("Error, can't kickban: " + net_decode_error(global.net_error_id));
	}



}
