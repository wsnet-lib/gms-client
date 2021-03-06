alarm[1] = room_speed * 3;
checkpoints = 0;
image_blend = global.car_colors[global.car_color];
key_boost = ord("X");
key_item = ord("Z");
boost_cooldown = 0;
laps = -1;
target = 0;
boost = 100;
arrived = false;
boost_consume = 1;
player_name = global.net_player_name;
player_id = global.net_player_id;
path_x = x + 1;
path_y = y;
physics_world_gravity(0, 0); 
var flags = phy_debug_render_coms | phy_debug_render_shapes | phy_debug_render_aabb;
physics_world_draw_debug(flags);
acceleration = 30;
max_speed = 100;
turn_radius = 100;

phy_angular_damping = 8; 
base_damping = 0.5;
phy_linear_damping = base_damping;

net_send_number(msg.color, all, image_blend);




