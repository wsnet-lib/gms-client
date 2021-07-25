/// @description net_on_lobby_get_list()
function net_on_lobby_get_list()
{
	//lobbies has been received

	var lobbies = global.net_lobbies;

	var sz = ds_list_size(lobbies);
	for(var i = 0; i < sz; i++)
	{
	    var lobby = lobbies[| i];
	    //var lobby_id = lobby[0];
	    //var lobby_name = lobby[1];
	    //var lobby_players = lobby[2];
	    //var lobby_max_players = lobby[3];
	    //var lobby_has_password = lobby[4];
    
	    show_debug_message(lobby);
	}
}