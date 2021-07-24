var vx = camera_get_view_x(view_camera);
var vy = camera_get_view_y(view_camera);
var vw = camera_get_view_width(view_camera);
var vh = camera_get_view_height(view_camera);
camera_set_view_pos(view_camera, 
	lerp(vx, x - vw/2 + clamp(phy_linear_velocity_x/2, -100, 100), 0.3),
	lerp(vy, y - vh/2 + clamp(phy_linear_velocity_y/2, -100, 100), 0.3))

var dir = point_direction(x, y, path_x, path_y);
draw_arrow(x, y, x + lengthdir_x(30, dir), y +lengthdir_y(30, dir), 2);
draw_circle(path_x, path_y, 100, 1);
 
draw_self();






