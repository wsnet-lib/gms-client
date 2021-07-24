/// @description net_on(msg_id, callback_function)
/// @param msg_id
/// @param  callback_function
function net_on(msg_id, callback_function) {

	if(msg_id < 0 || msg_id > global.net_callbacks_max)
	{
	    if(debug_mode)
	        show_error("ERROR: CALLBACK REGISTRATION OUT OF BOUND", true);
	    else
	        show_debug_message("ERROR: CALLBACK REGISTRATION OUT OF BOUND");
        
	    return false;
	}

	global.net_callbacks[msg_id] = callback_function;

	return true;
}
