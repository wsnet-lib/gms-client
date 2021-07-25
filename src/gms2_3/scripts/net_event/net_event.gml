/// @description net_event(event_type, callback_function)
/// @param event_type
/// @param  callback_function
function net_event(event_type, callback_function) 
{
	if(event_type < 0 || event_type > wsnet_evt.events_count)
	{
	    if(debug_mode)
	        show_error("ERROR: CALLBACK REGISTRATION OUT OF BOUND", true);
	    else
	        show_debug_message("ERROR: CALLBACK REGISTRATION OUT OF BOUND");
        
	    return false;
	}
	global.net_events[msg_id] = callback_function;
	return true;
}