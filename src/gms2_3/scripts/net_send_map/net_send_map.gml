/// @description net_send_map(msg_id, to, map)
/// @param msg_id
/// @param  to
/// @param  map
function net_send_map(msg_id, to, map)
{
	with(obj_wsnet)
	{
	    if(to < 0)
	        to = 255;
    
	    buffer_seek(buffer, buffer_seek_start, 0);
    
	    buffer_write(buffer, buffer_u8, wsnet_cmd.game_message);
	    buffer_write(buffer, buffer_u8, to); //dest
	    buffer_write(buffer, buffer_u16, msg_id); //msg id
    
	    buffer_write(buffer, buffer_u8, wsnet_type.map);
    
	    var len = ds_map_size(map); 
	    buffer_write(buffer, buffer_u16, len); 
		
	    var key = ds_map_find_first(map);
	    for(var i = 0; i < len; i++)
	    {
	        var val = map[? key];
	        buffer_write(buffer, buffer_string, key);
        
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
        
	        key = ds_map_find_next(map, key);
	    }
    
	    gws_send_buffer(ws, buffer, buffer_tell(buffer));
	}
}
