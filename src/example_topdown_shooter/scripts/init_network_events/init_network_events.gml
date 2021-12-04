
function init_network_events() 
{ 
	
 	//you created a lobby
	net_event(wsnet_evt.lobby_create, function (success, lobby_id) 
	{
		if(success)
		{
			
		}
		else
		{ 
			show_message_async("Error creating lobby: " + net_decode_error(global.net_error_id));
		}
	});
	
	//you joined a lobby
	net_event(wsnet_evt.lobby_join, function (success)
	{
		if(success)
		{
			 
		}
		else
		{ 
			show_message_async("Error, can't join:  " + net_decode_error(global.net_error_id));
		}
	});
	
	//you left the lobby
	net_event(wsnet_evt.lobby_leave, function (success)
	{
		if(success)
		{
			room_goto(rm_lobby);
			show_debug_message("Lobby left successfully");
		}
		else
		{
			show_message_async("Error, can't leave: " + net_decode_error(global.net_error_id));
		}
	});
	
	  
	//another player joined the lobby
	net_event(wsnet_evt.player_join, function(player) 
	{
		//var player_id = player[0];
		//var player_name = player[1];
		
	});
	
	//another player left the lobby
	net_event(wsnet_evt.player_leave, function(player) 
	{
		var player_id = player[0];
		//var player_name = player[1];

		//destroy the ship if we are in a match
		if(room == rm_game)
			ship_destroy(player_id);
	}); 
	
	//the server closed the connection
	net_event(wsnet_evt.connection_close, function()
	{
		show_debug_message("Connection closed by the server.");
		show_message_async("Connection closed by the server.");
		game_end();
	});
		
	//there was a network error
	net_event(wsnet_evt.error, function(error_code, error) 
	{
		show_message_async(string(error_code) + " |" + net_decode_error(error_code)); 
		room_goto(rm_lobby);
	});
}