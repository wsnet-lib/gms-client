/// @description on_chat(sender, message)
/// @param sender
/// @param  message
function on_chat(argument0, argument1) {

	var sender = global.net_players_map[? argument0];
	if(sender != undefined)
	{
	    ds_list_add(global.messages, string(sender[1]) + ": " + string(argument1));
	    if(ds_list_size(global.messages) > 10)
	        ds_list_delete(global.messages, 0);
	}



}
