/// @description test_msg_log_list(sender, list)
/// @param sender
/// @param  list
function test_msg_log_list(sender, list) {

	var sender = global.net_players_map[? sender];
	var str = "";
	for(var i = 0; i < ds_list_size(list); i++)
	    str += string(list[| i]) + ", ";
	ds_list_add(obj_gws_test.messages, "[" + string(sender[1]) + "]: " + str)



}
