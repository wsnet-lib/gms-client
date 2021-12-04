/// @description net_lobby_join_auto(username, date_sort, players_count_sort)
/// @param username
/// @param date_sort
/// @param players_count_sort
function net_lobby_join_auto(username, date_sort = wsnet_sort.no_sort, players_count_sort = wsnet_sort.no_sort)
{
	with(obj_wsnet)
	{
	    buffer_seek(buffer, buffer_seek_start, 0);
	    buffer_write(buffer, buffer_u8, wsnet_cmd.lobby_join_auto);
	    buffer_write(buffer, buffer_u8, date_sort); 
	    buffer_write(buffer, buffer_u8, players_count_sort); 
	    buffer_write(buffer, buffer_string, username);
	    return gws_send_buffer(ws, buffer, buffer_tell(buffer));
	}
}
