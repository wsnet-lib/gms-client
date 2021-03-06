/// @description net_lobby_password(password)
/// @param password
function net_lobby_password(argument0) {

	with(obj_wsnet)
	{
	    buffer_seek(buffer, buffer_seek_start, 0);
	    buffer_write(buffer, buffer_u8, wsnet_cmd.lobby_password);
	    buffer_write(buffer, buffer_string, argument0); //password
	    return gws_send_buffer(ws, buffer, buffer_tell(buffer));
	}



}
