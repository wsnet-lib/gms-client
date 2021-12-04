//ship
draw_self();

if(player_id == global.net_player_id)
	draw_set_color(c_yellow);

//name tag
draw_set_halign(fa_center);
draw_text(x, y - sprite_height - 20, string(player_name));
draw_set_halign(fa_left);
draw_set_color(c_white);