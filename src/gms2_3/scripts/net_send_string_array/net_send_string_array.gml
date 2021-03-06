/// @description net_send_string_array(msg_id, to, string_array)
/// @param msg_id
/// @param  to
/// @param  string_array
function net_send_string_array(argument0, argument1, argument2) {

	with(obj_wsnet)
	{
	    if(argument1 < 0)
	        argument1 = 255;
    
	    buffer_seek(buffer, buffer_seek_start, 0);
    
	    buffer_write(buffer, buffer_u8, wsnet_cmd.game_message);
	    buffer_write(buffer, buffer_u8, argument1);
	    buffer_write(buffer, buffer_u16, argument0);
	    buffer_write(buffer, buffer_u8, wsnet_type.text_array);
    
	    var len = array_length_1d(argument2);
	    buffer_write(buffer, buffer_u16, len);
	    for(var i = 0; i < len; i++)
	    {
	        var val = argument2[i];
	        buffer_write(buffer, buffer_string, val);
	    }
    
	    gws_send_buffer(ws, buffer, buffer_tell(buffer));
	}




}
