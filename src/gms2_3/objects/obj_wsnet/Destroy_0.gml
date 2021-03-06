ds_list_destroy(global.net_players);
ds_list_destroy(global.net_players_map);
ds_list_destroy(global.net_lobbies);
buffer_delete(buffer);

gws_disconnect(ws);

