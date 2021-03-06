/// @description net_send_string(msg_id, to, string)
/// @param msg_id
/// @param  to
/// @param  string
function net_send_string(argument0, argument1, argument2) {

	with(obj_wsnet)
	{
	    if(argument1 < 0)
	        argument1 = 255;
    
	    //strlen + null termination
	    var buf = gws_get_header_buffer(ws, 6 + string_byte_length(argument2));
	    buffer_write(buf, buffer_u8, wsnet_cmd.game_message);
	    buffer_write(buf, buffer_u8, argument1); //dest
	    buffer_write(buf, buffer_u16, argument0); //msg id
    
	    buffer_write(buf, buffer_u8, wsnet_type.text);
	    buffer_write(buf, buffer_string, argument2);
	    if(network_send_raw(ws.socket, buf, buffer_tell(buf)) < 0){ 
	        return gws_error.send;
	    }
	}



}
