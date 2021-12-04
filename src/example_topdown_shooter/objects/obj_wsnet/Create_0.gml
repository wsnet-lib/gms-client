
enum wsnet_evt
{
	connection_close,
	error,
	lobby_create,
	lobby_join,
	lobby_leave,
	lobby_allow_join,
	lobby_get_banned,
	lobby_get_list,
	lobby_max_players,
	lobby_password,
	lobby_transfer,
	lobby_unban,
	player_join,
	player_leave,
	player_kickban,
	player_username,
	events_count
}

enum wsnet_cmd 
{
    error,
    game_message,
    lobby_list,
    lobby_create,
    lobby_join,
    lobby_join_auto,
    lobby_player_joined,
    lobby_leave,
    lobby_player_left,
    lobby_transfer,
    lobby_transfer_changed,
    lobby_allow_join, 
    lobby_allow_join_changed, 
    lobby_max_players, 
    lobby_max_players_changed,
    lobby_kick,
    lobby_player_kicked,
    lobby_username,
    lobby_player_username,
    lobby_bans,
    lobby_unban,
    lobby_password,
}
  
enum wsnet_sort
{
    no_sort,
    ascending,
    descending
}

enum wsnet_type
{
    raw,
    byte,
    byte_array,
    number,
    number_array,
    text,
    text_array,
    array,
    list,
    map,
    integer64
}

enum wsnet_error
{
    no_error,
    command_not_found,
    player_not_found,
    lobby_not_found,
    unauthorized,
    wrong_password,
    max_lobby_players,
    input_validation_failed,
    already_in_lobby,
    server_error,
    callback_not_found,
    incorrect_type,
}


buffer = buffer_create(1024, buffer_grow, 1);
 
empty_callback = function(){}

global.net_callbacks_max = 1024;
global.net_callbacks = array_create(global.net_callbacks_max);
for(var i = global.net_callbacks_max - 1; i >= 0; i--)
    global.net_callbacks[i] = -1;
    
global.net_events = array_create(wsnet_evt.events_count);
for(var i = wsnet_evt.events_count - 1; i >= 0; i--)
    global.net_events[i] = empty_callback;

global.net_lobby_id = -1;
global.net_player_id = -1;
global.net_player_name = "";
global.net_admin_id = -1;
global.net_players = ds_list_create();
global.net_players_map = ds_map_create();
global.net_lobbies = ds_list_create();

ws = gws_connect(global.net_app_url, global.net_app_port);
if(ws == noone)
{
    instance_destroy();
    exit;
}

