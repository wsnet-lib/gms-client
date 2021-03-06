/// @description net_connect(app_url, app_port, callback)
/// @param app_url
/// @param  app_port
/// @param  callback
function net_connect(argument0, argument1, argument2) {
	with(obj_wsnet)
	{
	    instance_destroy();
	}
    
	global.net_app_url = argument0;
	global.net_app_port = argument1;
	global.net_connection_callback = argument2;
	var inst = instance_create(0,0, obj_wsnet);
	if(!instance_exists(inst) && script_exists(argument2))
	    script_execute(argument2, false);



}
