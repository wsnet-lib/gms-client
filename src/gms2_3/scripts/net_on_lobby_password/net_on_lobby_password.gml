/// @description net_on_lobby_password(success)
/// @param success
function net_on_lobby_password(success) 
{
	if(success)
	{
	    show_debug_message("Password changed successfully");
	}
	else
	{
	    show_debug_message("Error, can't change password: " + net_decode_error(global.net_error_id));
	}
}
