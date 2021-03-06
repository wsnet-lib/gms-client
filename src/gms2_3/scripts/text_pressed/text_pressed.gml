/// @description text_pressed(text, x, y, scale) 
/// @param text
/// @param  x
/// @param  y
/// @param  scale
function text_pressed(argument0, argument1, argument2, argument3) {
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	var ret = false;
	var text = argument0
	var px = argument1;
	var py = argument2;
	var scale = argument3; 
	var padding = 2;
	var w = (string_width(string_hash_to_newline(text))+padding * 2) * scale;
	var h = (string_height(string_hash_to_newline(text)) + padding * 2 - 2) * scale;
	var highlight = false;
	//for(var i=0;i<5;i++){
    
	    var mx=mouse_x//device_mouse_x_to_gui(i);
	    var my=mouse_y//device_mouse_y_to_gui(i);
	    if(mx>min(px,px+w) && my>min(py,py+h)
	      && mx<max(px,px+w) && my<max(py,py+h))
	    {
	        highlight = 1;
	        if(mouse_check_button_pressed(mb_left))
	        {
	             ret = 1;
	             //break;
	        }
	    }
    
	//}

	var col = draw_get_color();
	if(ret)
	    draw_set_color(c_green);
	else
	    draw_set_color(c_white);
 
	if(highlight)
	    draw_set_alpha(0.9);
	else
	    draw_set_alpha(0.7);
	draw_rectangle(px, py, px+w, py+h, 0);
 
	draw_set_alpha(1); 
	draw_set_color(c_black);
	draw_text_transformed(px + padding + w/2, py + padding + h/2, string_hash_to_newline(text), scale, scale, 0);
 
	draw_set_color(col);
 
	draw_set_halign(fa_left);
	draw_set_valign(fa_top); 
 
	return ret;



}
