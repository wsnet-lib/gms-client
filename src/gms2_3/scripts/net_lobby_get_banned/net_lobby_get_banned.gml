/// @description net_lobby_get_banned()
function net_lobby_get_banned() 
{
	with(obj_wsnet)
	{
	    buffer_seek(buffer, buffer_seek_start, 0);
	    buffer_write(buffer, buffer_u8, wsnet_cmd.lobby_bans);
	    return gws_send_buffer(ws, buffer, buffer_tell(buffer));
	}
}