/// @description net_event(event_type, callback_function)
/// @param event_type
/// @param  callback_function
function net_on(event_type, callback_function) 
{
	if(event_type < 0 || event_type > global.net_callbacks_max)
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