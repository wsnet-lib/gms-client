/// @description net_send_byte_array(msg_id, to, byte_array)
/// @param msg_id
/// @param  to
/// @param  byte_array
function net_send_byte_array(argument0, argument1, argument2) {

	with(obj_wsnet)
	{
	    if(argument1 < 0)
	        argument1 = 255;
    
	    buffer_seek(buffer, buffer_seek_start, 0);
	    buffer_write(buffer, buffer_u8, wsnet_cmd.game_message);
	    buffer_write(buffer, buffer_u8, argument1); //dest
	    buffer_write(buffer, buffer_u16, argument0); //msgid
	    buffer_write(buffer, buffer_u8, wsnet_type.byte_array);
    
	    var len = array_length_1d(argument2);
	    buffer_write(buffer, buffer_u16, len);
	    for(var i = 0; i < len; i++)
	    {
	        var val = argument2[i];
	        buffer_write(buffer, buffer_u8, val);
	    }
    
	    gws_send_buffer(ws, buffer, buffer_tell(buffer));
	}




}
