/// @description net_lobby_transfer(player_id)
/// @param player_id
function net_lobby_transfer(argument0) {

	with(obj_wsnet)
	{
	    buffer_seek(buffer, buffer_seek_start, 0);
	    buffer_write(buffer, buffer_u8, wsnet_cmd.lobby_transfer);
	    buffer_write(buffer, buffer_u8, argument0); //new admin id
	    return gws_send_buffer(ws, buffer, buffer_tell(buffer));
	}



}
