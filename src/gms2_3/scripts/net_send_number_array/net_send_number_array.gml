/// @description net_send_number_array(msg_id, to, number_array)
/// @param msg_id
/// @param to
/// @param number_array
function net_send_number_array(msg_id, to, number_array) 
{
	with(obj_wsnet)
	{
	    if(to < 0)
	        to = 255;
    
	    buffer_seek(buffer, buffer_seek_start, 0);
    
	    buffer_write(buffer, buffer_u8, wsnet_cmd.game_message);
	    buffer_write(buffer, buffer_u8, to); //dest
	    buffer_write(buffer, buffer_u16, msg_id); //msg id
	    buffer_write(buffer, buffer_u8, wsnet_type.number_array);
    
	    var len = array_length(number_array);
	    buffer_write(buffer, buffer_u16, len);
	    for(var i = 0; i < len; i++)
	    {
	        var val = number_array[i];
	        buffer_write(buffer, buffer_f32, val);
	    }
    
	    gws_send_buffer(ws, buffer, buffer_tell(buffer));
	}




}
