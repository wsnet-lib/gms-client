/// @description net_on_error(error_code, error)
/// @param error_code
/// @param  error
function net_on_error(error_code, error) 
{
	show_message(string(error_code) + " |" + net_decode_error(error)); 
	game_restart();
}
