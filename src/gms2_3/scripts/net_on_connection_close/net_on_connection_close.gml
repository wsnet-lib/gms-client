/// @description net_on_connection_close()
function net_on_connection_close() {

	show_debug_message("Connection closed by the server.");
	show_message("Connection closed by the server.");
	game_restart();



}
