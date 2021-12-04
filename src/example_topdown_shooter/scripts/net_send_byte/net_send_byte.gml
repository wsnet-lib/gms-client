/// @description net_send_byte(msg_id, to, value)
/// @param msg_id
/// @param to
/// @param value
function net_send_byte(msg_id, to, value) 
{
	with(obj_wsnet)
	{
	    if(to < 0)
	        to = 255;
        
	    var buf = gws_get_header_buffer(ws, 6);
	    buffer_write(buf, buffer_u8, wsnet_cmd.game_message);
	    buffer_write(buf, buffer_u8, to); //dest
	    buffer_write(buf, buffer_u16, msg_id); //msg id
    
	    buffer_write(buf, buffer_u8, wsnet_type.byte);
	    buffer_write(buf, buffer_u8, value);
	    if(network_send_raw(ws.socket, buf, buffer_tell(buf)) < 0){ 
	        return gws_error.send;
	    }
	}
}