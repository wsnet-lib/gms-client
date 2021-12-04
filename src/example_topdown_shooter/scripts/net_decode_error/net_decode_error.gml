/// @description net_decode_error(error_id)
/// @param error_id
function net_decode_error(error_id) 
{
	switch(error_id)
	{
	    case wsnet_error.command_not_found:
	        return "Command not found";
        
	    case wsnet_error.player_not_found:
	        return "Player not found";
        
	    case wsnet_error.lobby_not_found:
	        return "Lobby not found";
        
	    case wsnet_error.unauthorized:
	        return "Unauthorized";
        
	    case wsnet_error.wrong_password:
	        return "Wrong password";
        
	    case wsnet_error.max_lobby_players:
	        return "Lobby is full";
        
	    case wsnet_error.input_validation_failed:
	        return "Input validation failed";
        
	    case wsnet_error.already_in_lobby:
	        return "Already in a lobby";
        
	    case wsnet_error.server_error:
	        return "Internal server error";
        
	    case wsnet_error.incorrect_type:
	        return "GameMessage incorrect type";
        
	    case wsnet_error.callback_not_found:
	        return "Callback not found";
                
	    case wsnet_error.no_error:
	        return "No error";
                
	    default:
	        return "Unknown error";
        
	}
	return "Unknown error";
}
