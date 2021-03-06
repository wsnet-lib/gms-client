/// @description net_on_player_join(player)
/// @param player
function net_on_player_join(argument0) {
	var player_id = argument0[0];
	var player_name = argument0[1];

	show_debug_message("player joined " + player_name + "["+string(player_id)+"]");



}
