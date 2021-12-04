//ship
draw_self();

//name
draw_set_halign(fa_center);
draw_text(x, y - sprite_height - 20, string(player_name));
draw_set_halign(fa_left);