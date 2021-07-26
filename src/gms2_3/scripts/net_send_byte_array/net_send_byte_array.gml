/// @description net_send_byte_array(msg_id, to, byte_array)
/// @param msg_id
/// @param to
/// @param byte_array
function net_send_byte_array(msg_id, to, byte_array) 
{
	with(obj_wsnet)
	{
	    if(to < 0)
	        to = 255;
    
	    buffer_seek(buffer, buffer_seek_start, 0);
	    buffer_write(buffer, buffer_u8, wsnet_cmd.game_message);
	    buffer_write(buffer, buffer_u8, to); //dest
	    buffer_write(buffer, buffer_u16, msg_id); //msgid
	    buffer_write(buffer, buffer_u8, wsnet_type.byte_array);
    
	    var len = array_length(byte_array);
	    buffer_write(buffer, buffer_u16, len);
	    for(var i = 0; i < len; i++)
	    {
	        var val = byte_array[i];
	        buffer_write(buffer, buffer_u8, val);
	    }
    
	    gws_send_buffer(ws, buffer, buffer_tell(buffer));
	}
}