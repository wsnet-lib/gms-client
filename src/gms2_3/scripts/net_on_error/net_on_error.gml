/// @description net_on_error(error_code, error)
/// @param error_code
/// @param  error
function net_on_error(argument0, argument1) {

	show_message(string(argument1) + " |" + net_decode_error(argument0));
 
	game_restart();




}
