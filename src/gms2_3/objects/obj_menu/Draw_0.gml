var vx = camera_get_view_x(view_camera);
var vy = camera_get_view_y(view_camera);
var vw = camera_get_view_width(view_camera);
var vh = camera_get_view_height(view_camera);

draw_set_color($222222);
draw_rectangle(0, 0, vw, vh, false);
draw_set_color($eeeeee);
draw_set_halign(fa_center);
draw_text(vx + vw/2, vy + vh/2, string_hash_to_newline("PRESS START"));
draw_set_halign(fa_left);

if(keyboard_check_pressed(vk_enter))
    net_connect("asddaluseus2d.herokuapp.com", 80, on_accept);


