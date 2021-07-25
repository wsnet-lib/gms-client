/// @description net_on_lobby_create(success, lobby_id)
/// @param success
/// @param  lobby_id
function net_on_lobby_create(success, lobby_id) 
{
	if(success)
	{
	    show_debug_message("created lobby: " + string(lobby_id));
	    room_goto_next();
	}
	else
	{
	    obj_matchmaking.status = "Can't create lobby";
	    obj_matchmaking.alarm[0] = room_speed * 2;
	    show_debug_message("Error creating lobby: " + net_decode_error(global.net_error_id));
	}
}