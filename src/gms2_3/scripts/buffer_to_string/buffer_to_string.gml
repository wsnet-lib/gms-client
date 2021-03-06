/// @description buffer_to_string(buffer)
/// @param buffer
function buffer_to_string(argument0) {
	var str = "";
	var sz = buffer_get_size(argument0);
	var allowed = "ABCDEFGIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz123456789() ,.;:#@!'£$%&/()={}°";
	while(buffer_tell(argument0) < sz)
	{
	    var b = buffer_read(argument0, buffer_u8);
	    if(string_pos(chr(b), allowed) != 0)
	        str += chr(b);
	    else
	        str += "["+string(b)+"]";
	}

	return str;



}
