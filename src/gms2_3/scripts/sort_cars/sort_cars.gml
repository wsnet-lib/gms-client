/// @description sort_cars()
function sort_cars() {
	with(obj_game_manager)
	{
	    var num = instance_number(obj_car_remote);
	    ds_list_clear(sorted_cars);
	    ds_list_add(sorted_cars, instance_find(obj_car, 0));
	    for(var i = 0; i < num; i++)
	        ds_list_add(sorted_cars, instance_find(obj_car_remote, i));
    
	    //bubble sort
	    var len = ds_list_size(sorted_cars) - 1;
	    for (var i = 0; i < len; i++) 
	    {
	        for (var j = 0; j < len; j++) 
	        {
	            //don't sort arrived cars
	            if(sorted_cars[| j].arrived)
	                continue;
                                
	            if (sorted_cars[| j].checkpoints < sorted_cars[| j + 1].checkpoints) 
	            {
	                var tmp = sorted_cars[| j];
	                sorted_cars[| j] = sorted_cars[| j + 1];
	                sorted_cars[| j + 1] = tmp;
	            }
	        }
	    }
	}




}
