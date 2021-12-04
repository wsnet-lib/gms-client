/// @description log_buffer(buffer)
/// @param buffer
function log_buffer(buffer) 
{
	var str = "";
	var sz = buffer_get_size(buffer);
	var allowed = "ABCDEFGIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz123456789()#@!'£$%&/()={}°";
	while(buffer_tell(buffer) < sz)
	{
	    var b = buffer_read(buffer, buffer_u8);
	    if(string_pos(chr(b), allowed) != 0)
	        str += chr(b);
	    else
	        str += "["+string(b)+"]";
	}

	show_debug_message(str);
}