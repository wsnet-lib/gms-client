/// @description net_on_lobby_max_players(success, max_players)
/// @param success
/// @param max_players
function net_on_lobby_max_players(success, max_players)
{
	if(success)
	{
	    //successfully changed max players
	    show_debug_message("Max players changed successfully: " + string(max_players));
	}
	else
	{
	    show_debug_message("Error, can't change max players: " +net_decode_error(global.net_error_id));
	}
}
