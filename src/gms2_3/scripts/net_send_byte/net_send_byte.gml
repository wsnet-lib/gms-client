/// @description net_send_byte(msg_id, to, value)
/// @param msg_id
/// @param  to
/// @param  value
function net_send_byte(argument0, argument1, argument2) {

	with(obj_wsnet)
	{
	    if(argument1 < 0)
	        argument1 = 255;
        
	    var buf = gws_get_header_buffer(ws, 6);
	    buffer_write(buf, buffer_u8, wsnet_cmd.game_message);
	    buffer_write(buf, buffer_u8, argument1); //dest
	    buffer_write(buf, buffer_u16, argument0); //msg id
    
	    buffer_write(buf, buffer_u8, wsnet_type.byte);
	    buffer_write(buf, buffer_u8, argument2);
	    if(network_send_raw(ws.socket, buf, buffer_tell(buf)) < 0){ 
	        return gws_error.send;
	    }
	}



}
