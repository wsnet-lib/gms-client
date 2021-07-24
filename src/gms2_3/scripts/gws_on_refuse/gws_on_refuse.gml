/// @description gws_on_refuse(header)
/// @param header
function gws_on_refuse() 
{
	if(script_exists(global.net_connection_callback))
	    script_execute(global.net_connection_callback, false);
}
