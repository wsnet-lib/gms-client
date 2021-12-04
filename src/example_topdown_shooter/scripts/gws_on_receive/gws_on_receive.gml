/// @description gws_on_receive(buffer)
/// @param buffer
function gws_on_receive(buffer) 
{
	var buffer_size = buffer_get_size(buffer);

	if(debug_mode)
	    show_debug_message("Received full packet: " +string( buffer_size));
    
	if(buffer_size > 0)
	{

	    var cmd = buffer_read(buffer, buffer_u8);
	    switch(cmd)
	    {
	        case wsnet_cmd.game_message:
	            net_internal_handle_game_message(buffer, buffer_size);
	        break;
        
	        case wsnet_cmd.lobby_list:
	            ds_list_clear(global.net_lobbies);
             
	            while(buffer_tell(buffer) < buffer_size)
	            { 
	                //read lobby info
	                var lobby = array_create(4);
	                lobby[0] = buffer_read(buffer, buffer_u32); //id 
	                lobby[1] = buffer_read(buffer, buffer_string); //name 
	                lobby[2] = buffer_read(buffer, buffer_u8); //players
	                lobby[3] = buffer_read(buffer, buffer_u8); //max_players
	                lobby[4] = buffer_read(buffer, buffer_u8); //has_password 
	                ds_list_add(global.net_lobbies, lobby);
	            }
            
				global.net_events[wsnet_evt.lobby_get_list]();
	            break;
            
	        case wsnet_cmd.lobby_create:
	            global.net_error_id = buffer_read(buffer, buffer_u8);
	            if(global.net_error_id != wsnet_error.no_error)
	            {
	                global.net_events[wsnet_evt.lobby_create](false, -1);
	                break;
	            }
	            global.net_lobby_id = buffer_read(buffer, buffer_u32);
	            global.net_player_id = 0;
	            global.net_admin_id = 0;
            
	            var player = array_create(2);
	            player[0] = global.net_player_id;
	            global.net_player_name = buffer_read(buffer, buffer_string);
	            player[1] = global.net_player_name;
            
	            ds_list_add(global.net_players, player);
	            ds_map_add(global.net_players_map, global.net_player_id, player);
            
	            global.net_events[wsnet_evt.lobby_create](true, global.net_lobby_id);
	            break;
            
	        case wsnet_cmd.lobby_join:
	            global.net_error_id = buffer_read(buffer, buffer_u8);
	            if(global.net_error_id != wsnet_error.no_error)
	            {
	                global.net_events[wsnet_evt.lobby_join](false);
	                break;
	            }
	            ds_list_clear(global.net_players);
	            ds_map_clear(global.net_players_map);
            
	            global.net_lobby_id = buffer_read(buffer, buffer_u32);
	            global.net_admin_id = buffer_read(buffer, buffer_u8);
	            global.net_player_id = buffer_read(buffer, buffer_u8);
	            var num = buffer_read(buffer, buffer_u8);
            
	            for(var i = 0; i < num; i++)
	            {
	                var player = array_create(2);
	                var player_id = buffer_read(buffer, buffer_u8);
	                player[0] = player_id;
	                player[1] = buffer_read(buffer, buffer_string);
	                if(global.net_player_id == player_id)
	                    global.net_player_name = player[1]
	                ds_list_add(global.net_players, player);
	                ds_map_add(global.net_players_map, player_id, player);
	            }
	            global.net_events[wsnet_evt.lobby_join](true);
        
	            break;
                        
	        case wsnet_cmd.lobby_player_joined:
	            var player = array_create(2);
	            var player_id = buffer_read(buffer, buffer_u8);
	            player[0] = player_id;
	            player[1] = buffer_read(buffer, buffer_string);
	            ds_list_add(global.net_players, player);
	            ds_map_add(global.net_players_map, player_id, player);
				global.net_events[wsnet_evt.player_join](player);
	            break;
             
	        case wsnet_cmd.lobby_leave:
	            global.net_lobby_id = -1;
	            global.net_player_id = -1;
	            global.net_admin_id = -1;
	            global.net_player_name = "";
	            ds_list_clear(global.net_players);
	            ds_map_clear(global.net_players_map);
	            global.net_error_id = buffer_read(buffer, buffer_u8);
	            global.net_events[wsnet_evt.lobby_leave](global.net_error_id == wsnet_error.no_error);            
	            break;
            
	        case wsnet_cmd.lobby_player_left:
	            var player_id = buffer_read(buffer, buffer_u8);
	            global.net_admin_id = buffer_read(buffer, buffer_u8);
	            var player = ds_map_find_value(global.net_players_map, player_id);
	            if(player != undefined)
	            {
	                var idx = ds_list_find_index(global.net_players, player);
	                if(idx >= 0)
	                    ds_list_delete(global.net_players, idx); 
	                ds_map_delete(global.net_players_map, player_id);
	                global.net_events[wsnet_evt.player_leave](player);
	            }
	            break;
            
	        case wsnet_cmd.lobby_transfer:
	            global.net_error_id = buffer_read(buffer, buffer_u8); 
	            if(global.net_error_id != wsnet_error.no_error)
	            {
	                global.net_events[wsnet_evt.lobby_transfer](false, -1);
	                break;
	            }
	            global.net_admin_id = buffer_read(buffer, buffer_u8); 
	            global.net_events[wsnet_evt.lobby_transfer](true, global.net_admin_id);
	            break;
            
        
	        case wsnet_cmd.lobby_transfer_changed:
	            global.net_admin_id = buffer_read(buffer, buffer_u8); 
	            global.net_events[wsnet_evt.lobby_transfer](true, global.net_admin_id);
	            break;
        
	        case wsnet_cmd.lobby_allow_join:
	            global.net_error_id = buffer_read(buffer, buffer_u8); 
	            if(global.net_error_id != wsnet_error.no_error)
	            {
	                global.net_events[wsnet_evt.lobby_allow_join](false, -1);
	                break;
	            }
	            var allow_join = buffer_read(buffer, buffer_u8);
	            global.net_events[wsnet_evt.lobby_allow_join](true, allow_join);
	            break;
            
	         case wsnet_cmd.lobby_allow_join_changed:
	            var allow_join = buffer_read(buffer, buffer_u8);
	            global.net_events[wsnet_evt.lobby_allow_join](true, allow_join);
	            break;
            
	        case wsnet_cmd.lobby_max_players:
	            global.net_error_id = buffer_read(buffer, buffer_u8); 
	            if(global.net_error_id != wsnet_error.no_error)
	            {
	                global.net_events[wsnet_evt.lobby_max_players](false, -1);
	                break;
	            }
	            var max_players = buffer_read(buffer, buffer_u8);
	            global.net_events[wsnet_evt.lobby_max_players](true, max_players);
	            break;
            
	        case wsnet_cmd.lobby_max_players_changed:
	            var max_players = buffer_read(buffer, buffer_u8);
	            global.net_events[wsnet_evt.lobby_max_players](true, max_players);
	            break;
            
	        case wsnet_cmd.lobby_password:
	            global.net_error_id = buffer_read(buffer, buffer_u8); 
	            if(global.net_error_id != wsnet_error.no_error)
	            {
	                global.net_events[wsnet_evt.lobby_password](false);
	                break;
	            }
	            global.net_events[wsnet_evt.lobby_password](true);
	            break;
            
	        case wsnet_cmd.lobby_username:
	            global.net_error_id = buffer_read(buffer, buffer_u8); 
	            var player = array_create(2);
	            player[0] = global.net_player_id;
	            if(global.net_error_id != wsnet_error.no_error)
	            {
	                player[1] = global.net_player_name;
	                global.net_events[wsnet_evt.player_username](false, player);
	                break;
	            }
	            global.net_player_name = buffer_read(buffer, buffer_string); 
	            show_debug_message(global.net_player_name)
	            player[1] = global.net_player_name;
	            var p = global.net_players_map[? player[0]];
	            if(p != undefined)
	                p[@ 1] = player[1];
	            global.net_events[wsnet_evt.player_username](true, player);
	            break;
            
	         case wsnet_cmd.lobby_player_username:
	            show_debug_message("lobby_player_username");
	            var player = array_create(2);
	            player[0] = buffer_read(buffer, buffer_u8);
	            player[1] = buffer_read(buffer, buffer_string);
	            show_debug_message(player);
	            var p = global.net_players_map[? player[0]];
	            if(p != undefined)
	                p[@ 1] = player[1];
            
	            global.net_events[wsnet_evt.player_username](true, player);
	            break;
            
	        case wsnet_cmd.lobby_kick:
	            global.net_error_id = buffer_read(buffer, buffer_u8); 
	            if(global.net_error_id != wsnet_error.no_error)
	            {
	                global.net_events[wsnet_evt.player_kickban](false, -1, 0);
	                break;
	            }
	            var player_id = buffer_read(buffer, buffer_u8); 
	            var ban = buffer_read(buffer, buffer_u8);
            
	            var player = ds_map_find_value(global.net_players_map, player_id);
	            if(player != undefined)
	            {
	                var idx = ds_list_find_index(global.net_players, player);
	                if(idx >= 0)
	                    ds_list_delete(global.net_players, idx); 
	                ds_map_delete(global.net_players_map, player_id);
	                global.net_events[wsnet_evt.player_kickban](true, player, ban);
	            }
	        break;
            
	        case wsnet_cmd.lobby_player_kicked:
	            var player_id = buffer_read(buffer, buffer_u8); 
	            var ban = buffer_read(buffer, buffer_u8);
            
	            // i was kicked
	            if(player_id == global.net_player_id)
	            {
	                var player = global.net_players_map[? player_id];
	                global.net_events[wsnet_evt.player_kickban](true, player, ban);
                
	                global.net_lobby_id = -1;
	                global.net_player_id = -1;
	                global.net_admin_id = -1;
	                global.net_player_name = "";
	                ds_list_clear(global.net_players);
	                ds_map_clear(global.net_players_map);
	                break;
	            }
            
	            //kicked another player
	            var player = ds_map_find_value(global.net_players_map, player_id);
	            if(player != undefined)
	            {
	                var idx = ds_list_find_index(global.net_players, player);
	                if(idx >= 0)
	                    ds_list_delete(global.net_players, idx); 
	                ds_map_delete(global.net_players_map, player_id);
	                global.net_events[wsnet_evt.player_kickban](true, player, ban);
	            }             
	        break;
        
	        case wsnet_cmd.lobby_unban:
	            global.net_error_id = buffer_read(buffer, buffer_u8); 
	            if(global.net_error_id != wsnet_error.no_error)
	            {
	                global.net_events[wsnet_evt.lobby_unban](false, "");
	                break;
	            }
	            global.net_events[wsnet_evt.lobby_unban](true, buffer_read(buffer, buffer_string));
	        break;
        
	        case wsnet_cmd.lobby_bans:
	            global.net_error_id = buffer_read(buffer, buffer_u8); 
	            if(global.net_error_id != wsnet_error.no_error)
	            {
					global.net_events[wsnet_evt.lobby_get_banned](false, undefined);
	                break;
	            }
            
	            var count = buffer_read(buffer, buffer_u16);
	            var arr = array_create(count);
	            for(var i = 0; i < count; i++)
	            {
	                var player = array_create(2);
	                player[0] = buffer_read(buffer, buffer_string);
	                player[1] = buffer_read(buffer, buffer_string);
	                arr[i] = player;
	            }
	            global.net_events[wsnet_evt.lobby_get_banned](true, arr);
	            break;
        
	        case wsnet_cmd.error:
	            global.net_events[wsnet_evt.error](buffer_read(buffer, buffer_u8), "");
	        break;
        
	        default:
	            show_debug_message(" - content: " + str);
	            global.net_events[wsnet_evt.error](wsnet_error.command_not_found, "");
	            break;
	    }
    
	    if(debug_mode)
	        show_debug_message(" - content: " + str);
    
	}
	else
	{
	    show_debug_message("RECEIVED CORRUPTED MESSAGE");
	}
}
