/// @description test_msg_time(sender, time)
/// @param sender
/// @param time
function test_msg_time(sender, time)
{
	show_debug_message("ping: " + string(current_time - time) + "ms");
	ds_list_add(obj_gws_test.messages, "ping: " + string(current_time - time) + "ms")
}