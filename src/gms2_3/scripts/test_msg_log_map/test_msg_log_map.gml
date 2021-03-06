/// @description test_msg_log_map(sender, map)
/// @param sender
/// @param  map
function test_msg_log_map(argument0, argument1) {

	var sender = global.net_players_map[? argument0];
	var str = "";
	var key = ds_map_find_first(argument1);
	for(var i = 0; i < ds_map_size(argument1); i++)
	{
	    str += string(key) + ": " + string(argument1[? key]) + ", ";
	    key = ds_map_find_next(argument1, key);
	}
	ds_list_add(obj_test.messages, "[" + string(sender[1]) + "]: " + str)



}
