/// @description net_send_number(msg_id, to, number)
/// @param msg_id
/// @param to
/// @param number
function net_send_number(msg_id, to, number) 
{
	with(obj_wsnet)
	{
	    if(to < 0)
	        to = 255;
        
	    var buf = gws_get_header_buffer(ws, 13);
	    buffer_write(buf, buffer_u8, wsnet_cmd.game_message);
	    buffer_write(buf, buffer_u8, to); //dest
	    buffer_write(buf, buffer_u16, msg_id); //msg id
    
	    buffer_write(buf, buffer_u8, wsnet_type.number);
	    buffer_write(buf, buffer_f64, number);
	    if(network_send_raw(ws.socket, buf, buffer_tell(buf)) < 0){ 
	        return gws_error.send;
	    }
	}
}