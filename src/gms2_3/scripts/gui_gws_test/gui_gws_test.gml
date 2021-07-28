/// @description gui_test
function gui_gws_test() 
{

	draw_set_color(c_black);
	var sz = ds_list_size(global.net_players);
	for(var i = 0; i < sz; i++)
	{
	    var p = global.net_players[| i];
	    draw_text(140, i * 12, (string(p)));
	}
	var sz = ds_list_size(global.net_lobbies);
	for(var i = 0; i < sz; i++)
	{
	    var l = global.net_lobbies[| i];
	    draw_text(200, i * 12, (string(l)));
	}

	var px = 230;
	draw_text(px, 20, ("username: " + string(global.net_player_name)));
	draw_text(px, 30, ("Player id: " + string(global.net_player_id)));
	draw_text(px, 40, ("Admin id: " + string(global.net_admin_id)));
	draw_text(px, 50,("Lobby id: " + string(global.net_lobby_id))); 
	draw_text(px, 60, ("Admin: " + string(global.net_player_id == global.net_admin_id))); 

	var sz = ds_list_size(messages);
	var start = max(0, sz - 10);
	var n = 0;
	if(sz > 0)
		draw_text(px, 80, "MESSAGES:");
	for(var i = start; i < sz; i++)
	    draw_text(px, 100 + (n++) * 10, (messages[| i]));

	var increment = 20;
	var px = 0, py = 0;

	if(text_pressed("net_lobby_create", 10, py, 1))
	{
	    log("net_lobby_create");
	    net_lobby_create(get_string("Lobby name", "lobby1"), get_integer("max players", 2), get_string("username", choose("gino", "gianni", "zorro")), get_string("password", ""));
	}
	py += increment;

	if(text_pressed("net_lobby_get_list", 10, py, 1))
	{
	    log("net_lobby_get_list");
	    net_lobby_get_list();
	}
	py += increment;

	if(text_pressed("net_lobby_join", 10, py, 1))
	{
	    log("net_lobby_join");
	    net_lobby_join(get_integer("lobby id", 0), get_string("name", choose("tiz", "marco", "giorgio")), get_string("password", ""));
	}
	py += increment;

	if(text_pressed("net_lobby_join_auto", 10, py, 1))
	{
	    log("net_lobby_join_auto");
	    net_lobby_join_auto(get_string("username", choose("carlo", "fabio", "piero")), wsnet_sort.ascending, wsnet_sort.ascending);
	}
	py += increment;


	if(text_pressed("net_lobby_leave", 10, py, 1))
	{
	    log("net_lobby_leave");
	    net_lobby_leave();
	}
	py += increment;



	if(text_pressed("net_lobby_allow_join", 10, py, 1))
	{
	    log("net_lobby_allow_join");
	    var allow = show_question("Allow join?"); 
	    net_lobby_allow_join(allow);
	}
	py += increment;


	if(text_pressed("net_lobby_kick", 10, py, 1))
	{
	    log("net_lobby_kick");
	    net_lobby_kick(get_integer("player id", 0));
	}
	py += increment;

	if(text_pressed("net_lobby_ban", 10, py, 1))
	{
	    log("net_lobby_ban");
	    net_lobby_ban(get_integer("player id", 0));
	}
	py += increment;

	if(text_pressed("net_lobby_transfer", 10, py, 1))
	{
	    log("net_lobby_transfer");
	    net_lobby_transfer(get_integer("player id", 0));
	}
	py += increment;

	if(text_pressed("net_lobby_max_players", 10, py, 1))
	{
	    log("net_lobby_max_players");
	    net_lobby_max_players(get_integer("max players", 1));
	}
	py += increment;

	if(text_pressed("net_lobby_username", 10, py, 1))
	{
	    log("net_lobby_username");
	    net_lobby_username(get_string("New username", choose("lucio", "livio", "tonio")));
	}
	py += increment;

	if(text_pressed("net_lobby_password", 10, py, 1))
	{
	    log("net_lobby_password");
	    net_lobby_password(get_string("New password", ""));
	}
	py += increment;

	if(text_pressed("get banned", 10, py, 1))
	{
	    log("net_lobby_get_banned");
	    net_lobby_get_banned();
	}
	py += increment;

	if(text_pressed("net_lobby_unban", 10, py, 1))
	{
	    log("net_lobby_unban");
	    net_lobby_unban(get_string("player short-hash", ""));
	}
	py += increment;

	///GAME MESSAGES
	py = 0;
	px = 400;
	if(text_pressed("send chat", px, py, 1))
	{
	    log("net_send_string all");
	    net_send_string(msg_test.chat, all, get_string("Say something!",""));
	}
	py += increment;

	if(text_pressed("send chat private", px, py, 1))
	{
	    log("net_send_string dm");
	    net_send_string(msg_test.chat, get_integer("Player id", 0), get_string("Say something!",""));
	}
	py += increment;


	if(text_pressed("send array", px, py, 1))
	{
	    log("net_send_array");
	    var arr = array_create(3); 
	    arr[0] = 10000000000;
	    arr[1] = 0.000000001;
	    arr[2] = 3.1415161718; 
	    net_send_array(msg_test.chat, all, arr);
	}
	py += increment;


	if(text_pressed("send number", px, py, 1))
	{
	    log("net_send_number");  
	    net_send_number(msg_test.chat, all, 2.5);
	}
	py += increment;

	if(text_pressed("send number array", px, py, 1))
	{
	    log("net_send_number_array"); 
    
	    var arr = array_create(3);
	    arr[0] = 10000000000;
	    arr[1] = 0.000000001;
	    arr[2] = 3.1415161718; 
	    net_send_number_array(msg_test.chat, all, arr);
    
    
	}
	py += increment;


	if(text_pressed("send text array", px, py, 1))
	{
	    log("net_send_string_array");
	    var arr = array_create(3);
	    arr[0] = "primo";
	    arr[1] = 0.000000001;
	    arr[2] = "terzo"; 
	    net_send_string_array(msg_test.chat, all, arr);
	}
	py += increment;


	if(text_pressed("send byte", px, py, 1))
	{
	    log("net_send_byte_array"); 
	    net_send_byte(msg_test.chat, all, 36);
	}
	py += increment;


	if(text_pressed("send byte array", px, py, 1))
	{
	    log("net_send_byte_array");
	    var arr = array_create(3);
	    arr[0] = 1;
	    arr[1] = 255;
	    arr[2] = 1000; 
	    net_send_byte_array(msg_test.chat, all, arr);
	}
	py += increment;



	if(text_pressed("send buffer", px, py, 1))
	{
	    log("net_send");
	    var buf = buffer_create(10, buffer_grow, 1);
	    buffer_write(buf, buffer_string, "i'm a buffer: 1,2,3.");
	    net_send(msg_test.buffer, all, buf, buffer_tell(buf));
	    net_send(msg_test.buffer, all, buf, buffer_tell(buf)/2);
	}
	py += increment;



	if(text_pressed("send list", px, py, 1))
	{
	    log("send list");
	    var list = ds_list_create();
	    ds_list_add(list, "hey"); 
	    ds_list_add(list, 16); 
	    ds_list_add(list, 0.93); 
	    net_send_list(msg_test.dslist, all, list);
	}
	py += increment;

	if(text_pressed("send map", px, py, 1))
	{
	    log("send map");
	    var map = ds_map_create();
	    map[? "messaggio"] = "ciao";
	    map[? "vite"] = 3;
	    map[? "speed"] = 1.53;
	    net_send_map(msg_test.dsmap, all, map);
	}
	py += increment;


	if(text_pressed("ping test", px, py, 1))
	{
	    log("net_send_ping");  
	    net_send_number(msg_test.time, 0, current_time);
	}
	py += increment;


}
