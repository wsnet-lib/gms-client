/// @description log_buffer(buffer)
/// @param buffer
function log_buffer(argument0) {
	var str = "";
	var sz = buffer_get_size(argument0);
	var allowed = "ABCDEFGIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz123456789()#@!'£$%&/()={}°";
	while(buffer_tell(argument0) < sz)
	{
	    var b = buffer_read(argument0, buffer_u8);
	    if(string_pos(chr(b), allowed) != 0)
	        str += chr(b);
	    else
	        str += "["+string(b)+"]";
	}

	show_debug_message(str);



}
