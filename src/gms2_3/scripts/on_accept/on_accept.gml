/// @description on_accept(success)
/// @param success
function on_accept(success) {

	if(success)
	{ 
	    room_goto_next();
	}
	else
	{
	    show_debug_message("impossible to connect");
	}
}
