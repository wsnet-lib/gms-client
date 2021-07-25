/// @description gws_send_buffer(websocket, buffer, buffer_size)
/// @param websocket
/// @param buffer
/// @param buffer_size
function gws_send_buffer(websocket, buffer, buffer_size) 
{
	with(websocket)
	{
	    buffer_seek(send_buffer, buffer_seek_start, 0); 
      
	    var bitmask = (1 << 7) | gws_opcode.binary_frame;
	    buffer_write(send_buffer, buffer_u8, bitmask);
    
	    var mask = 0; //test with mask bit set to 0 for now
    
	    if(buffer_size < 126)
	    {
	        buffer_write(send_buffer, buffer_u8, mask | buffer_size);
	    }
	    else 
	    {
	        if(buffer_size < 65535)
	        {
	            buffer_write(send_buffer, buffer_u8, mask | 126);
	            //maybe
	            //buffer_write(buffer_size, buffer_u16, buffer_size); 
	            buffer_write(send_buffer, buffer_u8, buffer_size >> 8);
	            buffer_write(send_buffer, buffer_u8, buffer_size & 255);
	        }
	        else
	        {
	            show_debug_message("buffer too big, max is 65535");
	            return -1;
	        }
	    }
    
	    var header_size = buffer_tell(send_buffer);
	    buffer_copy(buffer, 0, buffer_size, send_buffer, header_size); 
	    if(network_send_raw(socket, send_buffer, header_size + buffer_size) < 0){ 
	        return gws_error.send;
	    }
	}
	
	return true;
}
