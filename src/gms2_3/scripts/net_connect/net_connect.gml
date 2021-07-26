/// @description net_connect(app_url, app_port, callback)
/// @param app_url
/// @param app_port
/// @param callback
function net_connect(app_url, app_port, callback) 
{
	with(obj_wsnet)
	{
	    instance_destroy();
	}
    
	global.net_app_url = app_url;
	global.net_app_port = app_port;
	global.net_connection_callback = callback;
	var inst = instance_create_depth(0, 0, 0, obj_wsnet);
	
	if(!instance_exists(inst) && script_exists(callback))
	    script_execute(callback, false);
}