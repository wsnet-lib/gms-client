var url = "wsnet-test.herokuapp.com";
url = "localhost"
dual_start();

net_connect(url, 7777, function(success) {
	
	if(success)
	{
		init_network_events();
		init_game_messages();
		
		room_goto(rm_lobby);
	}
	else
	{
	    show_message("Impossible to connect");
		game_end();
		exit;
	}
});

