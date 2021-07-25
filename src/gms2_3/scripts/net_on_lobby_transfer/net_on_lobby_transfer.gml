/// @description net_on_lobby_transfer(success, new_admin_id)
/// @param success
/// @param new_admin_id
function net_on_lobby_transfer(success, new_admin_id) 
{
	if(success)
	{
	    show_debug_message("Admin transfered to id [" + string(new_admin_id) +"]");
	}
	else
	{
	    show_debug_message("Error, can't transfer: " + net_decode_error(global.net_error_id));
	}
}
