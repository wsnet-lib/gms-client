draw_set_color(c_white);
if(global.race_end)
    draw_set_color(c_purple);
    
var _str = "";

var sz = ds_list_size(sorted_cars);
for(var i = 0; i < sz; i++)
{
    var inst = sorted_cars[| i];
    if(inst != undefined && instance_exists(inst))
    {
        var t = " arrived";
        if(!inst.arrived)
            t = " (" + string(inst.laps)  + " laps)";
        _str += string(i+1) + ") " + inst.player_name + t +"#";
    }
    else
    {
        ds_list_delete(sorted_cars, i);
        break;
    }
}

draw_text(10, 22, string_hash_to_newline(_str));

if(instance_exists(obj_car))
{
    draw_set_color(c_dkgray);
    draw_text(10, __view_get( e__VW.HView, 0 ) - 30, string_hash_to_newline("Boost: " + string(obj_car.boost)));
    draw_set_color(c_white);   
    
    
    //countdown before start
    if(obj_car.alarm[1] > 0)
    {
        var scale = 1 +  3 * ceil(obj_car.alarm[1]/room_speed) - obj_car.alarm[1]/room_speed;
        draw_set_halign(fa_center);
        draw_text_transformed(__view_get( e__VW.WView, 0 )/2, __view_get( e__VW.HView, 0 )/2, string_hash_to_newline(ceil(obj_car.alarm[1]/room_speed)), scale, scale, 0);
        draw_set_halign(fa_left);
    }
}
 

if(keyboard_check(vk_escape))
    esc_pressed++;
else
    esc_pressed = lerp(esc_pressed, 0, 0.1);
    
if(esc_pressed >= 1)
{
    draw_set_halign(fa_center);
    draw_text(__view_get( e__VW.WView, 0 )/2, __view_get( e__VW.HView, 0 )/2, string_hash_to_newline("Hold ESC to quit"));
    draw_set_halign(fa_left);
    if(esc_pressed > 60)
        game_restart();
}   


