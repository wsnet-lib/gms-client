
if(global.net_lobby_id < 0)
{
	if(text_pressed("CREATE LOBBY", 10, 10, 1))
	{
		var username = get_string("username", "");
		if(username != "")
			net_lobby_create("lobby", 5, username, "");
	}
	
	if(text_pressed("JOIN LOBBY", 10, 40, 1))
	{
		var lobby_id  = get_integer("lobby id", 0);
		if(lobby_id != undefined)
		{
			var username = get_string("username", ""); 
			if(username != "")
				net_lobby_join(lobby_id, username, "");
		}
	}
	
	if(text_pressed("JOIN LOBBY AUTO", 10, 70, 1))
	{
		var username = get_string("username", "");
		if(username != "")
			net_lobby_join_auto(username);
	}
	
	
}
else 
{
 
	draw_text(10, 50, "id " + string(global.net_player_id));
	//if i'm admin
	if(global.net_admin_id == global.net_player_id)
	{
		draw_text(10, 10, "Waiting for other players");
		draw_text(10, 30, "Lobby ID: " + string(global.net_lobby_id));
			
		//start game if there are at least 2 players
		if(ds_list_size(global.net_players) >= 2)
		{
			if(text_pressed("start", 10, 60, 1))
			{
				net_lobby_allow_join(false);
				net_send_byte(MID.start_game, all, true);
				room_goto(rm_game);
			}
		}
	}
	else
	{
		draw_text(10, 10, "Waiting the host to start");	
	} 
	
	
	if(keyboard_check_pressed(vk_escape))
		net_lobby_leave();	
	
}