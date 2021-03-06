draw_set_color($222222);
draw_rectangle(__view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 ), __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ), __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ), false);
draw_set_color($eeeeee);
var cx = __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 )/2;
var cy = __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 )/2;
draw_set_color(c_blue);
draw_text(10, 10, string_hash_to_newline(global.net_player_name));

var num = ds_list_size(global.net_players); 
draw_text(10, 24, string_hash_to_newline("Connected players: " + string(num)));
draw_set_color(c_white);

var controls = "#Arrows: Move#X: Boost";
draw_set_halign(fa_center);
if(is_admin())
{
    draw_text(cx, cy + 50, string_hash_to_newline("Waiting for players" + controls));
    if(text_pressed("START GAME > ", 10, __view_get( e__VW.HView, 0 ) - 20, 1))
    {
        net_lobby_allow_join(false);
        global.path_selected  = choose(1, 2);
        net_send_byte(msg.start, all, global.path_selected);
        room_goto_next();
    }
}
else
{
    draw_text(cx, cy + 50, string_hash_to_newline("Waiting for admin to start" + controls));

}
draw_set_halign(fa_left);

draw_set_color(c_white);
if(string_length(keyboard_string) <= 0)
    draw_text(10, 40, string_hash_to_newline("[ Type to chat... ]"));
else
{
    var s =  string_replace_all(keyboard_string, "#", "\\#");
    draw_text(10, 40, string_hash_to_newline(s));
}
 

if(keyboard_check_pressed(vk_enter) && string_length(keyboard_string) > 0)
{
    keyboard_string = string_replace_all(keyboard_string, "#", "\\#");
    net_send_string(msg.chat, all, keyboard_string);
    ds_list_add(global.messages, global.net_player_name + ": " + keyboard_string);
    if(ds_list_size(global.messages) > 10)
        ds_list_delete(global.messages, 0);
    keyboard_string = "";
}
   
draw_set_color(c_gray);
var str = "";
for(var i = 0; i < ds_list_size(global.messages); i++)
    str += string(global.messages[| i]) + "#";
draw_text(10, 55, string_hash_to_newline(str));
draw_set_color(c_white);



