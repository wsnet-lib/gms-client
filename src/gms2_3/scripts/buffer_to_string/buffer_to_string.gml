/// @description buffer_to_string(buffer)
/// @param buffer
function buffer_to_string(buffer) {
	var str = "";
	var sz = buffer_get_size(buffer);
	var allowed = "ABCDEFGIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz123456789() ,.;:#@!'£$%&/()={}°";
	while(buffer_tell(buffer) < sz)
	{
	    var b = buffer_read(buffer, buffer_u8);
	    if(string_pos(chr(b), allowed) != 0)
	        str += chr(b);
	    else
	        str += "["+string(b)+"]";
	}

	return str;



}
