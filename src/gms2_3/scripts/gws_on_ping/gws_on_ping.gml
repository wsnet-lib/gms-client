/// @description gws_on_ping(buffer)
/// @param buffer
function gws_on_ping(argument0) {
	var buffer = argument0;
	var buffer_size = buffer_get_size(argument0); 
	show_debug_message("Received ping: " +string( buffer_size));
	if(buffer_size > 0)
	{
	    var str = buffer_read(buffer, buffer_text);
	    show_debug_message("- content: " + str);
	}




}
