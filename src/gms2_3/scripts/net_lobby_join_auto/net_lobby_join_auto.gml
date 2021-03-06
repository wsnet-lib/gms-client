/// @description net_lobby_join_auto(username, date_sort, players_count_sort)
/// @param username
/// @param  date_sort
/// @param  players_count_sort
function net_lobby_join_auto() {
	if(argument_count < 1)
	    show_error("net_lobby_join_auto: argument count should be at least 1", false);
    
	with(obj_wsnet)
	{
	    buffer_seek(buffer, buffer_seek_start, 0);
	    buffer_write(buffer, buffer_u8, wsnet_cmd.lobby_join_auto);
    
	    if(argument_count > 1)
	        buffer_write(buffer, buffer_u8, argument[1]); 
	    else
	        buffer_write(buffer, buffer_u8, wsnet_sort.no_sort); 
        
	    if(argument_count > 2)
	        buffer_write(buffer, buffer_u8, argument[2]); 
	    else
	        buffer_write(buffer, buffer_u8, wsnet_sort.no_sort); 
        
	    buffer_write(buffer, buffer_string, argument[0]);
	    return gws_send_buffer(ws, buffer, buffer_tell(buffer));
	}



}
