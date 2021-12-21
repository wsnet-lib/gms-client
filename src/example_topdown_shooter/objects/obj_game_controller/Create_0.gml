
//spawn all the ships
for(var i = 0; i < ds_list_size(global.net_players); i++)
{
	var player = global.net_players[| i];  
	ship_spawn(player[0], player[1]);
}
 