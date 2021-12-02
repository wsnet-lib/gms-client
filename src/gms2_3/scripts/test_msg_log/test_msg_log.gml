/// @description test_msg_chat(sender, string)
/// @param sender
/// @param string
function test_msg_log(sender, str)
{
	var player = global.net_players_map[? sender];
	ds_list_add(obj_gws_test.messages, "[" + string(player[1]) + "]: " + string(str))
}

/// @description test_msg_time(sender, time)
/// @param sender
/// @param time
function test_msg_time(sender, time)
{
	show_debug_message("ping: " + string(current_time - time) + "ms");
	ds_list_add(obj_gws_test.messages, "ping: " + string(current_time - time) + "ms")
}

/// @description test_msg_log_buffer(sender, buffer, buffer_size)
/// @param sender
/// @param  buffer
/// @param  buffer_size
function test_msg_log_buffer(sender, buffer, buffer_size)
{
	ds_list_add(obj_gws_test.messages, "[" + string(sender) + "]: (" + string(buffer_size) + ") " + buffer_to_string(buffer));
}

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

/// @description test_msg_log_list(sender, list)
/// @param sender
/// @param list
function test_msg_log_list(sender, list) {

	var player = global.net_players_map[? sender];
	var str = "";
	for(var i = 0; i < ds_list_size(list); i++)
	    str += string(list[| i]) + ", ";
	ds_list_add(obj_gws_test.messages, "[" + string(player[1]) + "]: " + str);
}