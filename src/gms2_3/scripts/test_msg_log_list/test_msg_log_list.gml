/// @description test_msg_log_list(sender, list)
/// @param sender
/// @param  list
function test_msg_log_list(sender, list) {

	var player = global.net_players_map[? sender];
	var str = "";
	for(var i = 0; i < ds_list_size(list); i++)
	    str += string(list[| i]) + ", ";
	ds_list_add(obj_gws_test.messages, "[" + string(player[1]) + "]: " + str);
}
