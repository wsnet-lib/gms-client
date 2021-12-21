//if i'm the admin
if(global.net_admin_id == global.net_player_id)
{
	draw_text(10, 10, "You are the host");
	draw_text(10, 50, "id " + string(global.net_player_id));
	draw_text(10, 60, "admin " + string(global.net_admin_id));
}
else
{ 
	draw_text(10, 10, "You are a client"); 
	draw_text(10, 50, "id " + string(global.net_player_id));
	draw_text(10, 60, "admin " + string(global.net_admin_id));
}
		
//leave game when you press ESC
if(keyboard_check_pressed(vk_escape))
{
	net_lobby_leave();
	room_goto(rm_lobby);
}