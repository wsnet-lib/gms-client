/// @description gws_disconnect(ws)
/// @param ws
function gws_disconnect(argument0) {

	if(!instance_exists(argument0))
	    return false;
    
	with(argument0)
	{
	    //send disconnect 
	    buffer_seek(send_buffer, buffer_seek_start, 0);
    
	    var bitmask = (1 << 7) | gws_opcode.connection_close;
	    buffer_write(send_buffer, buffer_u8, bitmask);
    
	    var mask = 0; 
	    buffer_write(send_buffer, buffer_u8, mask | 0);
    
	    if(network_send_raw(socket, send_buffer, 2) < 0)
	    { 
	        instance_destroy();
	        return gws_error.send;
	    }
	    instance_destroy();
	}
	return true;



}
