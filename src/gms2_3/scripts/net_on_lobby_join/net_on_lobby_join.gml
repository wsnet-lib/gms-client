/// @description net_on_lobby_join(success, lobby_id, player_id)
/// @param success
/// @param  lobby_id
/// @param  player_id
function net_on_lobby_join(argument0) {
	if(argument0)
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
