draw_set_color($222222);
draw_rectangle(0, 0, __view_get( e__VW.WView, 0 ), __view_get( e__VW.HView, 0 ), false);
draw_set_color($eeeeee);
draw_set_halign(fa_center);
draw_text(__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 )/2, __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 )/2, string_hash_to_newline("PRESS START"));
draw_set_halign(fa_left);

if(keyboard_check_pressed(vk_enter))
    net_connect("localhost", 8080, on_accept);


