/// @description net_send_number(msg_id, to, number)
/// @param msg_id
/// @param  to
/// @param  number
function net_send_number(argument0, argument1, argument2) {

	with(obj_wsnet)
	{
	    if(argument1 < 0)
	        argument1 = 255;
        
	    var buf = gws_get_header_buffer(ws, 13);
	    buffer_write(buf, buffer_u8, wsnet_cmd.game_message);
	    buffer_write(buf, buffer_u8, argument1); //dest
	    buffer_write(buf, buffer_u16, argument0); //msg id
    
	    buffer_write(buf, buffer_u8, wsnet_type.number);
	    buffer_write(buf, buffer_f64, argument2);
	    if(network_send_raw(ws.socket, buf, buffer_tell(buf)) < 0){ 
	        return gws_error.send;
	    }
	}



}
