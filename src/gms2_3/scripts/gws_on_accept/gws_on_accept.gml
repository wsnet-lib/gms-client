/// @description gws_on_accept()
function gws_on_accept() 
{
	if(is_method(global.net_connection_callback))
		global.net_connection_callback(true);
	else if(script_exists(global.net_connection_callback))
		script_execute(global.net_connection_callback, true);
}
