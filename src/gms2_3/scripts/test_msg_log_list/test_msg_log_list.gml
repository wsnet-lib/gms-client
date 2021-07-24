/// @description test_msg_log_list(sender, list)
/// @param sender
/// @param  list
function test_msg_log_list(argument0, argument1) {

	var sender = global.net_players_map[? argument0];
	var str = "";
	for(var i = 0; i < ds_list_size(argument1); i++)
	    str += string(argument1[| i]) + ", ";
	ds_list_add(obj_gws_test.messages, "[" + string(sender[1]) + "]: " + str)



}
