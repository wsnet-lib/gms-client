//if i'm the admin
if(global.net_admin_id == global.net_player_id)
{
	draw_text(10, 10, "You are the host");
}
else
{ 
	draw_text(10, 10, "You are a client");
}
		
//leave game
if(keyboard_check_pressed(vk_escape))
{
	net_lobby_leave();
	room_goto(rm_lobby);
}