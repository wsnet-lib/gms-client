/// @description on_chat(sender, message)
/// @param sender
/// @param  message
function on_chat(sender, message) {

	var player = global.net_players_map[? sender];
	if(player != undefined)
	{
	    ds_list_add(global.messages, string(player[1]) + ": " + string(message));
	    if(ds_list_size(global.messages) > 10)
	        ds_list_delete(global.messages, 0);
	}



}
