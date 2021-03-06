__view_set( e__VW.XView, 0, lerp(__view_get( e__VW.XView, 0 ), x - __view_get( e__VW.WView, 0 )/2 + clamp(phy_linear_velocity_x/2, -100, 100), 0.3) );
__view_set( e__VW.YView, 0, lerp(__view_get( e__VW.YView, 0 ), y - __view_get( e__VW.HView, 0 )/2 + clamp(phy_linear_velocity_y/2, -100, 100), 0.3) );


var dir = point_direction(x, y, path_x, path_y);
draw_arrow(x, y, x + lengthdir_x(30, dir), y +lengthdir_y(30, dir), 2);
draw_circle(path_x, path_y, 100, 1);
 
draw_self();



//image_angle = phy_rotation;

//phy_speed = clamp(phy_speed, -max_speed, max_speed);







