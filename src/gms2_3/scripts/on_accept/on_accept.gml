/// @description on_connect(result)
/// @param result
function on_accept(argument0) {

	if(argument0)
	{ 
	    room_goto_next();
	}
	else
	{
	    show_message("Impossible to connect");
	}



}
