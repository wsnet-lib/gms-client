enum MID
{
	ship_position,
	ship_shot,
	start_game
}
 
function receive_start_game(sender, started)
{
	room_goto(rm_game);	
}

function receive_ship_info(sender, ship_info)
{	
	var ship = ship_get(sender);
	if(ship != noone)
	{
		ship.x = ship_info[0];
		ship.y = ship_info[1];
		ship.image_angle = ship_info[2]; 
		ship.direction = image_angle;
	} 
} 

function receive_ship_shot(sender, bullet_info)
{
	var bullet_x = bullet_info[0];
	var bullet_y = bullet_info[1];
		
	var bullet_speed = bullet_info[2];
	var bullet_dir = bullet_info[3];
		
	var inst = instance_create_depth(bullet_x, bullet_y, 0, obj_bullet);
	inst.speed = bullet_speed;
	inst.direction = bullet_dir;
	inst.image_angle = bullet_dir;
}

function init_game_messages()
{
	net_on(MID.ship_position, receive_ship_info);
	net_on(MID.ship_shot, receive_ship_shot);	
	net_on(MID.start_game, receive_start_game);	
}