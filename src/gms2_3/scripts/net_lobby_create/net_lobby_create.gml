/// @description net_lobby_create(lobby_name, max_players, user_name, password)
/// @param lobby_name
/// @param  max_players
/// @param  user_name
/// @param  password
function net_lobby_create(argument0, argument1, argument2, argument3) {
	with(obj_wsnet)
	{
	    buffer_seek(buffer, buffer_seek_start, 0);
	    buffer_write(buffer, buffer_u8, wsnet_cmd.lobby_create);
	    buffer_write(buffer, buffer_string, argument0); //name
	    buffer_write(buffer, buffer_u8, argument1); //max players
	    buffer_write(buffer, buffer_string, argument2); //username
	    buffer_write(buffer, buffer_string, argument3); //password
	    return gws_send_buffer(ws, buffer, buffer_tell(buffer));
	}



}
