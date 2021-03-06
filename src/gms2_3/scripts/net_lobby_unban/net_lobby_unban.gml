/// @description net_lobby_unban(short_hash)
/// @param short_hash
function net_lobby_unban(argument0) {

	with(obj_wsnet)
	{
	    buffer_seek(buffer, buffer_seek_start, 0);
	    buffer_write(buffer, buffer_u8, wsnet_cmd.lobby_unban);
	    buffer_write(buffer, buffer_string, argument0);
	    return gws_send_buffer(ws, buffer, buffer_tell(buffer));
	}



}
