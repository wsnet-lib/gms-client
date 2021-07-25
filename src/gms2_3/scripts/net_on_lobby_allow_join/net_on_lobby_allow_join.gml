/// @description net_on_lobby_allow_join(success, allow)
/// @param success
/// @param  allow
function net_on_lobby_allow_join(success, allow) 
{
	if(success)
	{ 
	    show_debug_message("Lobby allow join changed successfully: " + string(allow));
	}
	else
	{
	    show_debug_message("Error, can't change allow join: " + net_decode_error(global.net_error_id));
	}
}