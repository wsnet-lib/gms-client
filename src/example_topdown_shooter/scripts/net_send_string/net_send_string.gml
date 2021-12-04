/// @description net_send_string(msg_id, to, string)
/// @param msg_id
/// @param  to
/// @param  string
function net_send_string(msg_id, to, str)
{
	with(obj_wsnet)
	{
	    if(to < 0)
	        to = 255;
    
	    //strlen + null termination
	    var buf = gws_get_header_buffer(ws, 6 + string_byte_length(str));
	    buffer_write(buf, buffer_u8, wsnet_cmd.game_message);
	    buffer_write(buf, buffer_u8, to); //dest
	    buffer_write(buf, buffer_u16, msg_id); //msg id
    
	    buffer_write(buf, buffer_u8, wsnet_type.text);
	    buffer_write(buf, buffer_string, str);
	    if(network_send_raw(ws.socket, buf, buffer_tell(buf)) < 0){ 
	        return gws_error.send;
	    }
	}
}