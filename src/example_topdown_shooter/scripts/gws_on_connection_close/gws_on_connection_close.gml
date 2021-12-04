/// @description gws_on_connection_close()
function gws_on_connection_close()
{
	global.net_events[wsnet_evt.connection_close]();
}
