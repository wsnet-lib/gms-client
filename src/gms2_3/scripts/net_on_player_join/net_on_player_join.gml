/// @description net_on_player_join(player)
/// @param player
function net_on_player_join(player) 
{
	var player_id = player[0];
	var player_name = player[1];

	show_debug_message("player joined " + player_name + "["+string(player_id)+"]");
}