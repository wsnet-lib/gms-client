

/// @description  Start 2 instances of the game to test
function dual_start(){
	
	if (parameter_count() == 3) 
	{
	    shell_execute(parameter_string(0),
	        parameter_string(1) + " " +
	        parameter_string(2) + " " +
	        parameter_string(3) + " -secondary") 
	     
	    window_set_caption("P1");
	} 
	else if (parameter_count() == 4) 
	{  
	    window_set_caption("P2"); 
		window_set_position(window_get_x() + 25, window_get_y());
	}
}