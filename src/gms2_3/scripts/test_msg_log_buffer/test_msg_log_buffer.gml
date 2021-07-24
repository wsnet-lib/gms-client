/// @description test_msg_log_buffer(sender, buffer, buffer_size)
/// @param sender
/// @param  buffer
/// @param  buffer_size
function test_msg_log_buffer(sender, buffer, buffer_size)
{
	ds_list_add(obj_gws_test.messages, "[" + string(sender) + "]: (" + string(buffer_size) + ") " + buffer_to_string(buffer));
}
