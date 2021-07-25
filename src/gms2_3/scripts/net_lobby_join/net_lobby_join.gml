/// @description net_lobby_join(lobby_id, username, password)
/// @param lobby_id
/// @param username
/// @param password
function net_lobby_join(lobby_id, username, password) 
{
	with(obj_wsnet)
	{
	    buffer_seek(buffer, buffer_seek_start, 0);
	    buffer_write(buffer, buffer_u8, wsnet_cmd.lobby_join);
	    buffer_write(buffer, buffer_string, username); //username
	    buffer_write(buffer, buffer_u32, lobby_id);  //lobby id        
	    buffer_write(buffer, buffer_string, password); //password 
	    return gws_send_buffer(ws, buffer, buffer_tell(buffer));
	}
}