/// @description net_on_unban(success, short_hash)
/// @param success
/// @param short_hash
function net_on_lobby_unban(success, short_hash) {
 
	if(success)
	{
	    //successfully changed
	    show_debug_message("Player unbanned successfully: " + string(short_hash));
	}
	else
	{
	    show_debug_message("Error, can't unban: " +net_decode_error(global.net_error_id));
	}
}