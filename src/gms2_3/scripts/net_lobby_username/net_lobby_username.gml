/// @description net_lobby_username(username)
/// @param username
function net_lobby_username(argument0) {

	with(obj_wsnet)
	{
	    buffer_seek(buffer, buffer_seek_start, 0);
	    buffer_write(buffer, buffer_u8, wsnet_cmd.lobby_username);
	    buffer_write(buffer, buffer_string, argument0); //username
	    return gws_send_buffer(ws, buffer, buffer_tell(buffer));
	}



}
