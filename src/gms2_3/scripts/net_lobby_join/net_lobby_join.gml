/// @description net_lobby_join(lobby_id, user_name, password)
/// @param lobby_id
/// @param  user_name
/// @param  password
function net_lobby_join(argument0, argument1, argument2) {

	with(obj_wsnet)
	{
	    buffer_seek(buffer, buffer_seek_start, 0);
	    buffer_write(buffer, buffer_u8, wsnet_cmd.lobby_join);
	    buffer_write(buffer, buffer_string, argument1); //username
	    buffer_write(buffer, buffer_u32, argument0);  //lobby id        
	    buffer_write(buffer, buffer_string, argument2); //password 
	    return gws_send_buffer(ws, buffer, buffer_tell(buffer));
	}



}
