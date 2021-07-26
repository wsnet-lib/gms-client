/// @description net_send_list(msg_id, to, list)
/// @param msg_id
/// @param  to
/// @param  list
function net_send_list(msg_id, to, list) 
{
	with(obj_wsnet)
	{
	    if(to < 0)
	        to = 255;
    
	    buffer_seek(buffer, buffer_seek_start, 0);
    
	    buffer_write(buffer, buffer_u8, wsnet_cmd.game_message);
	    buffer_write(buffer, buffer_u8, to); // dest
	    buffer_write(buffer, buffer_u16, msg_id); // msg id
    
	    buffer_write(buffer, buffer_u8, wsnet_type.list);
    
	    var len = ds_list_size(list);
	    buffer_write(buffer, buffer_u16, len);
	    for(var i = 0; i < len; i++)
	    {
	        var val = list[| i];
        
	        if(is_real(val))
	        {
	            buffer_write(buffer, buffer_u8, wsnet_type.number);
	            buffer_write(buffer, buffer_f64, val);
	        }
	        else if(is_string(val))
	        {
	            buffer_write(buffer, buffer_u8, wsnet_type.text); 
	            buffer_write(buffer, buffer_string, val);        
	        }
	        else if(is_bool(val))
	        {
	            buffer_write(buffer, buffer_u8, wsnet_type.byte);
	            buffer_write(buffer, buffer_u8, val);
	        }
	        else if(is_int64(val))
	        {
	            buffer_write(buffer, buffer_u8, wsnet_type.integer64);
	            buffer_write(buffer, buffer_u64, val);
	        }
	        else 
	        {
	            show_error("wrong type", true);
	        }
	    }
    
	    gws_send_buffer(ws, buffer, buffer_tell(buffer));
	}
}
