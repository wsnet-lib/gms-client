/// @description test_msg_chat(sender, string)
/// @param sender
/// @param  string
function test_msg_log(argument0, argument1) {
	var sender = global.net_players_map[? argument0];
	ds_list_add(obj_gws_test.messages, "[" + string(sender[1]) + "]: " + string(argument1))



}
