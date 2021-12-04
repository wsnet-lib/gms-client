/// @description net_lobby_create(lobby_name, max_players, user_name, password)
/// @param lobby_name
/// @param max_players
/// @param user_name
/// @param password
function net_lobby_create(lobby_name, max_players, user_name, password) 
{
	with(obj_wsnet)
	{
	    buffer_seek(buffer, buffer_seek_start, 0);
	    buffer_write(buffer, buffer_u8, wsnet_cmd.lobby_create);
	    buffer_write(buffer, buffer_string, lobby_name); //name
	    buffer_write(buffer, buffer_u8, max_players); //max players
	    buffer_write(buffer, buffer_string, user_name); //username
	    buffer_write(buffer, buffer_string, password); //password
	    return gws_send_buffer(ws, buffer, buffer_tell(buffer));
	}
}