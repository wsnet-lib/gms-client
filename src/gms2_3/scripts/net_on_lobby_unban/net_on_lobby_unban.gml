/// @description net_on_unban(success, short_hash)
/// @param success
/// @param  short_hash
function net_on_lobby_unban(argument0, argument1) {
 
	if(argument0)
	{
	    //successfully changed
	    var short_hash = argument1;
	    show_debug_message("Player unbanned successfully: " + string(short_hash));
	}
	else
	{
	    show_debug_message("Error, can't unban: " +net_decode_error(global.net_error_id));
	}



}
