/// @description test_msg_chat(sender, string)
/// @param sender
/// @param string
function test_msg_log(sender, str)
{
	var sender = global.net_players_map[? sender];
	ds_list_add(obj_gws_test.messages, "[" + string(sender[1]) + "]: " + string(str))
}