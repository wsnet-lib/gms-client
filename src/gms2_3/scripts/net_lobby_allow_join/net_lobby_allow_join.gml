/// @description net_lobby_allow_join(allow)
/// @param allow
function net_lobby_allow_join(argument0) {

	with(obj_wsnet)
	{
	    buffer_seek(buffer, buffer_seek_start, 0);
	    buffer_write(buffer, buffer_u8, wsnet_cmd.lobby_allow_join);
	    buffer_write(buffer, buffer_u8, argument0); 
	    return gws_send_buffer(ws, buffer, buffer_tell(buffer));
	}



}
