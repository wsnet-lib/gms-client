/// @description test_msg_log_buffer(sender, buffer, buffer_size)
/// @param sender
/// @param  buffer
/// @param  buffer_size
function test_msg_log_buffer(argument0, argument1) {
	ds_list_add(obj_test.messages, "[" + string(argument0) + "]: " + buffer_to_string(argument1));



}
