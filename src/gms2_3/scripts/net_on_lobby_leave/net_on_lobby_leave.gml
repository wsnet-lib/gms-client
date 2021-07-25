/// @description net_on_lobby_leave(success)
/// @param success
function net_on_lobby_leave(success)
{
	if(success)
	{
	    show_debug_message("lobby left successfully");
	}
	else
	{
	    show_debug_message("Error, can't leave: " + net_decode_error(global.net_error_id));
	}
}
