/// @description draw_path_sprite(path, x, y, width, sprite, spriteIndex, spriteScaleX, spriteScaleY, color, alpha, segments, tiled)
/// @param path
/// @param  x
/// @param  y
/// @param  width
/// @param  sprite
/// @param  spriteIndex
/// @param  spriteScaleX
/// @param  spriteScaleY
/// @param  color
/// @param  alpha
/// @param  segments amount of segments between two points on the path (more = smoother)
/// @param  tiled should the sprite be tiled over the path (0 = no tiling, 1 = tiling)
function draw_path_sprite(path, pathX, pathY, width, spriteTex, spriteIndex, repeatX, repeatY, color, alpha, _segments, tiled) {
 
	var sprite = sprite_get_texture(spriteTex, spriteIndex);
	var segments = path_get_number(path) * max(1, _segments);
	//var closed = path_get_closed(path);
	var spw = path_get_length(path) / sprite_get_width(spriteTex);

	draw_primitive_begin_texture(pr_trianglestrip, sprite);

	var lastDir = 0;
	for (var i = 0; i <= segments; i++)
	{
	    //var stepPrev = (i % segments) / segments;
	    var step = i / segments;    
	    var stepNext = (i + 1) / segments;
    
	    //var pxPrev = pathX + path_get_x(path, stepPrev);
	    //var pyPrev = pathY + path_get_y(path, stepPrev);
    
	    var px = pathX + path_get_x(path, step);
	    var py = pathY + path_get_y(path, step);
    
	    var pxNext = pathX + path_get_x(path, stepNext);
	    var pyNext = pathY + path_get_y(path, stepNext);
    
	    var dir = point_direction(px, py, pxNext, pyNext);
	    if (i == segments) dir = lastDir;
	    lastDir = dir;
    
	    var x1 = px + lengthdir_x(width / 2, dir - 90);
	    var y1 = py + lengthdir_y(width / 2, dir - 90);
	    var x2 = px + lengthdir_x(width / 2, dir + 90);
	    var y2 = py + lengthdir_y(width / 2, dir + 90);
    
	    var uv = step;
	    if (tiled) uv *= spw;
	    uv *= repeatX;

	    draw_vertex_texture_colour(x1, y1, uv, repeatY, color, alpha);
	    draw_vertex_texture_colour(x2, y2, uv, 0, color, alpha);
	}

	gpu_set_texrepeat(true);
	draw_primitive_end();
	gpu_set_texrepeat(false);

}