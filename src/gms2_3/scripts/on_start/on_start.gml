/// @description on_start(sender, path_idx)
/// @param sender
/// @param  path_idx
function on_start(sender, path_idx) 
{
	global.path_selected = path_idx;
	room_goto_next();
}
