/// @description test_msg_log_map(sender, map)
/// @param sender
/// @param map
function test_msg_log_map(sender, map)
{
	var player = global.net_players_map[? sender];
	var str = "";
	var key = ds_map_find_first(map);
	for(var i = 0; i < ds_map_size(map); i++)
	{
	    str += string(key) + ": " + string(map[? key]) + ", ";
	    key = ds_map_find_next(map, key);
	}
	ds_list_add(obj_gws_test.messages, "[" + string(player[1]) + "]: " + str)
}