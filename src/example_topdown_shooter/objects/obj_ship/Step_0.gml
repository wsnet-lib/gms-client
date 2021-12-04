///@desc ship movements
//control this ship only if it's me
if(player_id != global.net_player_id)
	exit;

if(keyboard_check(vk_up)){
	speed = min(speed + acceleration, max_speed);	
}

if(keyboard_check(vk_down)){
	speed = max(speed - acceleration, 0);	
}

if(keyboard_check(vk_left)){
	image_angle += rot_speed;
	direction = image_angle;
}

if(keyboard_check(vk_right)){
	image_angle -= rot_speed;
	direction = image_angle;
}

speed = speed * 0.99

if(keyboard_check_pressed(ord("Z")))
{
	var bullet_x = x + lengthdir_x(10, image_angle);
	var bullet_y = y + lengthdir_y(10, image_angle);
	
	var inst = instance_create_depth(bullet_x, bullet_y, 0, obj_bullet);
	inst.speed = speed + 3;
	inst.image_angle = image_angle;
	inst.direction = direction;
	
	//send the bullet to other players
	net_send_array(MID.ship_shot, all, [bullet_x, bullet_y, inst.speed, image_angle]);
}
