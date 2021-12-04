//spawn your ship
ship_spawn(global.net_player_id, global.net_player_name); 		
			
//spawn other players ship
for(var i = 0; i < ds_list_size(global.net_players); i++)
{
	var player = global.net_players[| i];  
	ship_spawn(player[0], player[1]);
}