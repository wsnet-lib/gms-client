/// @description net_on_lobby_max_players(success, max_players)
/// @param success
/// @param  max_players
function net_on_lobby_max_players(argument0, argument1) {
	if(argument0)
	{
	    //successfully changed max players
	    var max_players = argument1;
	    show_debug_message("Max players changed successfully: " + string(max_players));
	}
	else
	{
	    show_debug_message("Error, can't change max players: " +net_decode_error(global.net_error_id));
	}



}
