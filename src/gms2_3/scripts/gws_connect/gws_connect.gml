/// @description gws_connect(url, port)
/// @param url
/// @param  port
function gws_connect(argument0, argument1) {
	//connect to the websocket server 

	var inst = instance_create(0, 0, obj_websocket);

	with(inst)
	{
	    url = argument0;
	    port = argument1;
     
	    socket = network_create_socket(network_socket_tcp);
	    if(network_connect_raw(socket, url, port) < 0)
	    {
	        show_debug_message("can't_connect");
	        instance_destroy();
	        return noone;
	    }
    
	    //build header
	    var nl = chr(13) + chr(10);
	    var str = "GET / HTTP/1.1" + nl +
	    "Host: " + url + nl +
	    "Connection: Upgrade" + nl +
	    "Pragma: no-cache" + nl +
	    "Cache-Control: no-cache" + nl +
	    "Upgrade: websocket" + nl +
	    //"Origin: " + url + nl +
	    "Sec-WebSocket-Version: 13" + nl +
	    "Sec-WebSocket-Key: Q2a/gzoUTK69Ts89FPFaLA==" + nl + nl;
    
    
	    buffer_seek(send_buffer, buffer_seek_start, 0); 
	    buffer_write(send_buffer, buffer_text, str)
    
	    // send upgrade request 
	    if(network_send_raw(socket, send_buffer, buffer_tell(send_buffer)) < 0)
	    {
	        instance_destroy();
	        return noone;
	    }
    
	    alarm[0] = ping_interval * room_speed;
	}

	return inst;




}
