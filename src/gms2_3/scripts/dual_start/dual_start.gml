

/// @description  Dual-start
function dual_start(){
	if (parameter_count() == 3) {
	    shell_execute(parameter_string(0),
	        parameter_string(1) + " " +
	        parameter_string(2) + " " +
	        parameter_string(3) + " -secondary") 
	    // <primary instance>
	    window_set_caption("P1");
	}
	if (parameter_count() == 4) { 
	    // <secondary instance>
	    window_set_caption("P2");
		
		window_set_position(window_get_x() + 25, window_get_y());
	}
}