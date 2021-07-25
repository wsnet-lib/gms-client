/// @description net_send(msg_id, to, buffer, count)
/// @param msg_id
/// @param to
/// @param buffer
/// @param count
function net_send(msg_id, to, _buffer, count) 
{
	with(obj_wsnet)
	{
	    if(to < 0)
	        to = 255;
	    var send_size = floor(count)
	    var buf = gws_get_header_buffer(ws, 5 + send_size);
	    buffer_write(buf, buffer_u8, wsnet_cmd.game_message);
	    buffer_write(buf, buffer_u8, to); //dest
	    buffer_write(buf, buffer_u16, msg_id); //msg id
    
	    buffer_write(buf, buffer_u8, wsnet_type.raw);
    
	    var offset = buffer_tell(buf);
	    buffer_copy(_buffer, 0, send_size, buf, offset);
    
	    if(network_send_raw(ws.socket, buf, offset + send_size) < 0){ 
	        return gws_error.send;
	    }
	}
}