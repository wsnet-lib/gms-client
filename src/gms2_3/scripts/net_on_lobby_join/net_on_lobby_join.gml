/// @description net_on_lobby_join(success)
/// @param success
function net_on_lobby_join(success)
{
	if(success)
	{
	    show_debug_message ( 
	        "[JOINED] lobby id: " + string(global.net_lobby_id) + ", " +
	        "player id: " + string(global.net_player_id)
	    );
    
	    room_goto_next();
	}
	else
	{
	    if(global.net_error_id == wsnet_error.lobby_not_found)
	    {
	        net_lobby_create("lobby", 4, obj_matchmaking.username, ""); 
        
	        obj_matchmaking.status = "Creating game";
	    }
	    else
	        show_debug_message("Error, can't join:  " + net_decode_error(global.net_error_id));
	}
}