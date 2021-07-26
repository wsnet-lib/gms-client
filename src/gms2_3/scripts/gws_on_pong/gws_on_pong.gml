/// @description gws_on_pong(buffer)
/// @param buffer
function gws_on_pong(buffer) 
{
	var buffer_size = buffer_get_size(buffer);

	if(debug_mode)
		show_debug_message("Received pong: " +string( buffer_size));
	if(buffer_size > 0)
	{
	    var str = buffer_read(buffer, buffer_text);
	    show_debug_message("- content: " + str);
	}
}
