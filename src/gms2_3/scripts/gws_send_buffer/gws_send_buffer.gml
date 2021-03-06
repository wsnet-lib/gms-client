/// @description gws_send_buffer(websocket, buffer, size)
/// @param websocket
/// @param  buffer
/// @param  size
function gws_send_buffer(argument0, argument1, argument2) {

	with(argument0)
	{
	    var payload = argument1;
	    var payload_size = argument2;

	    buffer_seek(send_buffer, buffer_seek_start, 0); 
      
	    var bitmask = (1 << 7) | gws_opcode.binary_frame;
	    buffer_write(send_buffer, buffer_u8, bitmask);
    
	    var mask = 0; //test with mask bit set to 0 for now
    
	    if(payload_size < 126)
	    {
	        buffer_write(send_buffer, buffer_u8, mask | payload_size);
	    }
	    else 
	    {
	        if(payload_size < 65535)
	        {
	            buffer_write(send_buffer, buffer_u8, mask | 126);
	            //maybe
	            //buffer_write(payload_size, buffer_u16, payload_size); 
	            buffer_write(send_buffer, buffer_u8, payload_size >> 8);
	            buffer_write(send_buffer, buffer_u8, payload_size & 255);
	        }
	        else
	        {
	            show_debug_message("payload too big, max is 65535");
	            return -1;
	        }
	    }
    
	    var header_size = buffer_tell(send_buffer);
	    buffer_copy(payload, 0, payload_size, send_buffer, header_size); 
	    if(network_send_raw(socket, send_buffer, header_size + payload_size) < 0){ 
	        return gws_error.send;
	    }
	}
	return true;



}
