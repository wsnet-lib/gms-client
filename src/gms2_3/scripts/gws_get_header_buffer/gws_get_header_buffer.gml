/// @description gws_get_send_buffer(websocket, payload_size)
/// @param websocket
/// @param payload_size
function gws_get_header_buffer(websocket, payload_size)
{
	with(websocket)
	{ 

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
	            show_error("payload too big, max is 65535", true);
	            return -1;
	        }
	    }

	    return send_buffer;
	}
}
