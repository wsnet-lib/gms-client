/// @description log(msg1, msg2, ...)
/// @param msg1
/// @param  msg2
/// @param  ...
function log() {
	var str = "";
	for(var i = 0; i< argument_count; i++)
	    str += string(argument[i]) + "  ";

	show_debug_message(str);




}
