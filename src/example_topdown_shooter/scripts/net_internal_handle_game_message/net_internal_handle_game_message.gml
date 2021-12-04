/// @description net_internal_handle_game_message(buffer, buffer_size)
/// @param buffer
/// @param  buffer_size
function net_internal_handle_game_message(buffer, buffer_size) 
{
	var sender_id = buffer_read(buffer, buffer_u8);
	var msg_id = buffer_read(buffer, buffer_u16);
	var type = buffer_read(buffer, buffer_u8);

	var script = global.net_callbacks[msg_id];
	if(script == -1)
	{
	    log("sender id:", sender_id, ", msg_id:", msg_id, ", type:", type);
	    log_buffer(buffer_read(buffer, buffer_size - buffer_tell(buffer)));
		global.net_events[wsnet_evt.error](wsnet_error.callback_not_found, "Error: unregistered callback for msg_id = " + string(msg_id));
	    return 0;
	}

	log("sender id:", sender_id, ", msg_id:", msg_id, ", type:", type);
	switch(type)
	{
	    case wsnet_type.raw:
	        //buffer
	        /*
	        buffer_seek(msg_buffer, buffer_seek_start, 0);
	        var tell = buffer_tell(buffer);
	        buffer_resize(msg_buffer, buffer_size - tell);
	        buffer_copy(buffer, tell, buffer_size - tell, msg_buffer, 0);
	        */
			
	        script_execute(script, sender_id, buffer, buffer_size);
	        break;
        
	    case wsnet_type.byte:
	        //byte
	        script_execute(script, sender_id, buffer_read(buffer, buffer_u8));
	        break;
        
	    case wsnet_type.byte_array:
	        //byte array  
	        var len = buffer_read(buffer, buffer_u16);
	        var a = array_create(len);
	        for(var i = 0; i < len; i++) 
	            a[i] = buffer_read(buffer, buffer_u8); 
	        script_execute(script, sender_id, a);
	        break;
        
	    case wsnet_type.number:
	        script_execute(script, sender_id, buffer_read(buffer, buffer_f64));
	        //number
	        break;
        
	    case wsnet_type.number_array:
	        //number array 
	        var len = buffer_read(buffer, buffer_u16);
	        var a = array_create(len); 
	        for(var i = 0; i < len; i++) 
	            a[i] = buffer_read(buffer, buffer_f32); 
	        script_execute(script, sender_id, a);
	        break;

	    case wsnet_type.text:
	        //text
	        script_execute(script, sender_id, buffer_read(buffer, buffer_string));
	        break;
        
	    case wsnet_type.text_array:
	        //text array
	        var len = buffer_read(buffer, buffer_u16);
	        var a = array_create(len);
	        for(var i = 0; i < len; i++)
	            a[i] = buffer_read(buffer, buffer_string); 
	        script_execute(script, sender_id, a);
	        break;

	    case wsnet_type.array:
	        //array
	        var len = buffer_read(buffer, buffer_u16);
	        var a = array_create(len);
	        for(var i = 0; i < len; i++) 
	        {
	            var t = buffer_read(buffer, buffer_u8);
	            if(t == wsnet_type.number)
	                a[i] = buffer_read(buffer, buffer_f64);
                
	            else if(t == wsnet_type.text)
	                a[i] = buffer_read(buffer, buffer_string);
                
	            else if(t == wsnet_type.byte)
	                a[i] = buffer_read(buffer, buffer_u8); 
                
	            else if(t == wsnet_type.integer64)
	                a[i] = buffer_read(buffer, buffer_u64);
                
	        }
			show_debug_message(script_get_name(script));
	        script_execute(script, sender_id, a);
	        break;
        
	    case wsnet_type.list:
	        //list
	        var len = buffer_read(buffer, buffer_u16);
	        var a = ds_list_create();
	        for(var i = 0; i < len; i++) 
	        {
	            var t = buffer_read(buffer, buffer_u8);
	            if(t == wsnet_type.number)
	                ds_list_add(a, buffer_read(buffer, buffer_f64));
                
	            else if(t == wsnet_type.text)
	                ds_list_add(a, buffer_read(buffer, buffer_string));
                
	            else if(t == wsnet_type.byte)
	                ds_list_add(a, buffer_read(buffer, buffer_u8));
                
	            else if(t == wsnet_type.integer64)
	                a[i] = buffer_read(buffer, buffer_u64);
	        }
	        script_execute(script, sender_id, a);
	        break;
        
	    case wsnet_type.map:
	        //map
	        var len = buffer_read(buffer, buffer_u16);
	        var a = ds_map_create();
	        for(var i = 0; i < len; i++) 
	        {
	            var key = buffer_read(buffer, buffer_string); 
	            var t = buffer_read(buffer, buffer_u8);
	            if(t == wsnet_type.number)
	                ds_map_add(a, key, buffer_read(buffer, buffer_f64));
                
	            else if(t == wsnet_type.text)
	                ds_map_add(a, key, buffer_read(buffer, buffer_string));
                
	            else if(t == wsnet_type.byte)
	                ds_map_add(a, key, buffer_read(buffer, buffer_u8));
                                
	            else if(t == wsnet_type.integer64)
	                a[i] = buffer_read(buffer, buffer_u64);
	        }
	        script_execute(script, sender_id, a);
	        break;

	    default:
	        global.net_events[wsnet_evt.error](wsnet_error.incorrect_type, "Error: Incorrect type " + string(type));
	        return 0;
	}
}
