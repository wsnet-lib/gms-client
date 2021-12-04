///@desc ship sync

//control this ship only if it's me
if(player_id != global.net_player_id)
	return;
	
//send position and rotation
net_send_array(MID.ship_position, all, [x, y, image_angle]);