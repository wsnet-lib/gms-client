function ship_spawn(player_id, player_name)
{
	var inst = instance_create_depth(room_width/2, room_height/2, 0, obj_ship);
	inst.player_id = player_id;
	inst.player_name = player_name;	
}
	
function ship_destroy(_player_id)
{
	with(obj_ship)
	{
		if(self.player_id == _player_id)
			instance_destroy();
	}
}

function ship_get(_player_id)
{
	with(obj_ship)
	{
		if(self.player_id == _player_id)
			return self;
	}
	
	return noone;
}