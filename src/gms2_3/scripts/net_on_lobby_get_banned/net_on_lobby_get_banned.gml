/// @description net_on_lobby_get_banned(success, banned_players)
/// @param success
/// @param banned_players
function net_on_lobby_get_banned(success, banned_players) 
{
	if(success)
	{
	    var sz = array_length_1d(banned_players);
	    var str = "";
	    for(var i = 0; i < sz; i++)
	    {
	        var player = banned_players[i];
	        var shortid = player[0];
	        var player_name = player[1];
	        str += shortid + ": " + player_name + " | ";
	    }
	    show_debug_message(str);
	}
	else
	{
	    show_debug_message("Error, can't get banned list: " + net_decode_error(global.net_error_id));
	}
}