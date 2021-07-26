function register_network_events()
{

	net_event(wsnet_evt.connection_close, function()
	{
		show_debug_message("Connection closed by the server.");
		show_message("Connection closed by the server.");
		game_restart();
	});
		
	net_event(wsnet_evt.error, function(error_code, error) 
	{
		show_message(string(error_code) + " |" + net_decode_error(error)); 
		game_restart();
	});
		
	net_event(wsnet_evt.lobby_allow_join, function(success, allow) 
	{
		if(success)
		{ 
		    show_debug_message("Lobby allow join changed successfully: " + string(allow));
		}
		else
		{
		    show_debug_message("Error, can't change allow join: " + net_decode_error(global.net_error_id));
		}
	});

	net_event(wsnet_evt.lobby_create, function (success, lobby_id) 
	{
		if(success)
		{
		    show_debug_message("created lobby: " + string(lobby_id));
		    room_goto_next();
		}
		else
		{
		    obj_matchmaking.status = "Can't create lobby";
		    obj_matchmaking.alarm[0] = room_speed * 2;
		    show_debug_message("Error creating lobby: " + net_decode_error(global.net_error_id));
		}
	});
	
	net_event(wsnet_evt.lobby_get_banned, function (success, banned_players) 
	{
		if(success)
		{
		    var sz = array_length(banned_players);
		    var str = "";
		    for(var i = 0; i < sz; i++)
		    {
		        var player = banned_players[i];
		        var shortid = player[0];
		        var player_name = player[1];
		        str += shortid + ": " + player_name + " | ";
		    }
		    show_debug_message(str);
		}
		else
		{
		    show_debug_message("Error, can't get banned list: " + net_decode_error(global.net_error_id));
		}
	});
	
	net_event(wsnet_evt.lobby_get_list, function()
	{
		//lobbies has been received

		var lobbies = global.net_lobbies;

		var sz = ds_list_size(lobbies);
		for(var i = 0; i < sz; i++)
		{
		    var lobby = lobbies[| i];
		    //var lobby_id = lobby[0];
		    //var lobby_name = lobby[1];
		    //var lobby_players = lobby[2];
		    //var lobby_max_players = lobby[3];
		    //var lobby_has_password = lobby[4];
    
		    show_debug_message(lobby);
		}
	});
	
	net_event(wsnet_evt.lobby_join, function (success)
	{
		if(success)
		{
		    show_debug_message ( 
		        "[JOINED] lobby id: " + string(global.net_lobby_id) + ", " +
		        "player id: " + string(global.net_player_id)
		    );
    
		    room_goto_next();
		}
		else
		{
		    if(global.net_error_id == wsnet_error.lobby_not_found)
		    {
		        net_lobby_create("lobby", 4, obj_matchmaking.username, ""); 
        
		        obj_matchmaking.status = "Creating game";
		    }
		    else
		        show_debug_message("Error, can't join:  " + net_decode_error(global.net_error_id));
		}
	});
		
	net_event(wsnet_evt.lobby_leave, function (success)
	{
		if(success)
		{
		    show_debug_message("lobby left successfully");
		}
		else
		{
		    show_debug_message("Error, can't leave: " + net_decode_error(global.net_error_id));
		}
	});

	net_event(wsnet_evt.lobby_max_players, function(success, max_players)
	{
		if(success)
		{
		    //successfully changed max players
		    show_debug_message("Max players changed successfully: " + string(max_players));
		}
		else
		{
		    show_debug_message("Error, can't change max players: " +net_decode_error(global.net_error_id));
		}
	});

	net_event(wsnet_evt.lobby_password, function(success) 
	{
		if(success)
		{
		    show_debug_message("Password changed successfully");
		}
		else
		{
		    show_debug_message("Error, can't change password: " + net_decode_error(global.net_error_id));
		}
	});
	
	net_event(wsnet_evt.lobby_transfer, function(success, new_admin_id) 
	{
		if(success)
		{
		    show_debug_message("Admin transfered to id [" + string(new_admin_id) +"]");
		}
		else
		{
		    show_debug_message("Error, can't transfer: " + net_decode_error(global.net_error_id));
		}
	});

	net_event(wsnet_evt.lobby_unban, function(success, short_hash) 
	{ 
		if(success)
		{
		    //successfully changed
		    show_debug_message("Player unbanned successfully: " + string(short_hash));
		}
		else
		{
		    show_debug_message("Error, can't unban: " +net_decode_error(global.net_error_id));
		}
	});
	
	net_event(wsnet_evt.player_join, function(player) 
	{
		var player_id = player[0];
		var player_name = player[1];

		show_debug_message("player joined " + player_name + "["+string(player_id)+"]");
	});
	
	net_event(wsnet_evt.player_leave, function(player) 
	{
		var _player_id = player[0];
		var player_name = player[1];

		show_debug_message("player left " + player_name + "["+string(_player_id)+"]");
		with(obj_car_remote)
		{
		    if(player_id == _player_id)
		        instance_destroy();
		}
	});

	net_event(wsnet_evt.player_kickban, function(success, player, banned)
	{
		if(success)
		{
		    var player_id = player[0];
		    var player_name = player[1];
    
		    //0 = kick, 1 = ban
		    if(banned)
		        show_debug_message("Player banned: " + player_name + "["+string(player_id)+"]");
			else
		        show_debug_message("Player kicked: " + player_name + "["+string(player_id)+"]");
		}
		else
		{
		    show_debug_message("Error, can't kickban: " + net_decode_error(global.net_error_id));
		}
	});
	
	net_event(wsnet_evt.player_username, function(success, player) 
	{
		if(success)
		{
		    var player_id = player[0];
		    var player_name = player[1];
    
		    show_debug_message("player changed name " + player_name + "["+string(player_id)+"]");
		}
		else
		{
		    show_debug_message("Error, can't change allow join: " + net_decode_error(global.net_error_id));
		}
	});
	
}