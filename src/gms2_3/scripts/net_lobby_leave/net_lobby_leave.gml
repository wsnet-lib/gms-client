/// @description net_lobby_leave()
function net_lobby_leave() {

	with(obj_wsnet)
	{
	    global.net_lobby_id = -1;
	    global.net_player_id = -1;
	    global.net_admin_id = -1;
	    global.net_player_name = "";
	    buffer_seek(buffer, buffer_seek_start, 0);
	    buffer_write(buffer, buffer_u8, wsnet_cmd.lobby_leave); 
	    return gws_send_buffer(ws, buffer, buffer_tell(buffer));
	}
}
