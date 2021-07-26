/// @description net_lobby_ban(player_id)
/// @param player_id
function net_lobby_ban(player_id) 
{
	with(obj_wsnet)
	{
	    buffer_seek(buffer, buffer_seek_start, 0);
	    buffer_write(buffer, buffer_u8, wsnet_cmd.lobby_kick);
	    buffer_write(buffer, buffer_u8, player_id); //playername
	    buffer_write(buffer, buffer_u8, 1); //0: kick, 1: ban
	    return gws_send_buffer(ws, buffer, buffer_tell(buffer));
	}
}