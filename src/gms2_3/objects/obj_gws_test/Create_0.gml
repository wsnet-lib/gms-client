messages = ds_list_create();


dual_start();

var url = "wsnet-test.herokuapp.com";
net_connect(url, 80, function(success){
	
	if(success)
	{
		draw_set_font(gws_font_test);

		enum msg_test
		{
		    buffer,
		    chat,
		    dsmap,
		    dslist,
			time,
		}

		init_network_events();
	}
	else
	{
	    show_message("Unable to connect to " + string(url));
		game_end();
		exit;
	}
});




