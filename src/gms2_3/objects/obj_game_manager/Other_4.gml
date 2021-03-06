var paths = array_create(3);
paths[0] = path_pista_1;
paths[1] = path_pista_2;
paths[2] = path_pista_1;
var backgrounds = array_create(3);
backgrounds[0] = background0;
backgrounds[1] = background1;
backgrounds[2] = background0;

global.current_path = paths[global.path_selected];
__background_set( e__BG.Index, 0, backgrounds[global.path_selected] );

var sz = ds_list_size(global.net_players);
for(var i = 0; i < sz; i++)
{
    var p = global.net_players[| i];
    var player_id = p[0];
    var player_name = p[1];
    
        
    var px = path_get_x(global.current_path, 0);
    var py = path_get_y(global.current_path, 0) + 32 * sz/2 ;

    //create me
    if(player_id == global.net_player_id)
    {
        instance_create(px, py - i * 32, obj_car);
        continue;
    }
    //create remote players
    else
    {
        var inst = instance_create(px , py - i * 32, obj_car_remote);
        inst.player_id = player_id;
        inst.player_name = player_name;
    }
    
}

//create boost pads
var incr = 1/(path_get_number(global.current_path)/2);
bid = 0;
for(var i = 0; i < 1; i+= incr)
{
    var px = path_get_x(global.current_path, i);
    var py = path_get_y(global.current_path, i);
    var j = 0;
    repeat(3)
    {
        var inst = instance_create(
            px + lengthdir_x(40, j), 
            py + lengthdir_y(40, j), obj_boost);
        inst.my_id = bid++;
        j+=360/3;
    }
     
}


