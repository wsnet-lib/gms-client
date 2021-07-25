/// @description net_disconnect()
function net_disconnect() 
{
	with(obj_wsnet)
	    instance_destroy();
}