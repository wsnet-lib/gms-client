/// @description net_send_string_array(msg_id, to, string_array)
/// @param msg_id
/// @param to
/// @param string_array
function net_send_string_array(msg_id, to, string_array) 
{
	with(obj_wsnet)
	{
	    if(to < 0)
	        to = 255;
    
	    buffer_seek(buffer, buffer_seek_start, 0);
    
	    buffer_write(buffer, buffer_u8, wsnet_cmd.game_message);
	    buffer_write(buffer, buffer_u8, to);
	    buffer_write(buffer, buffer_u16, msg_id);
	    buffer_write(buffer, buffer_u8, wsnet_type.text_array);
    
	    var len = array_length(string_array);
	    buffer_write(buffer, buffer_u16, len);
	    for(var i = 0; i < len; i++)
	    {
	        var val = string_array[i];
	        buffer_write(buffer, buffer_string, val);
	    }
    
	    gws_send_buffer(ws, buffer, buffer_tell(buffer));
	}
}