if(alarm[1] > 0)
{
    
    exit;
}

var n = path_get_number(global.current_path);
path_x = path_get_x(global.current_path, target/n);
path_y = path_get_y(global.current_path, target/n);

if(point_distance(x, y, path_x, path_y) < 100)
{
    if(target == 0)
    {
        laps++; 
        net_send_byte(msg.laps, all, laps);
        if(laps >= 4)
        {
            arrived = true;
            global.race_end = true;
            
        }
    }
    checkpoints++;
    sort_cars();
    net_send_number(msg.checkpoints, all, checkpoints);
        
    target ++
    if(target >= path_get_number(global.current_path))
        target = 0;
}

var force = 0;
if(keyboard_check(vk_up))
    force = acceleration;
else if(keyboard_check(vk_down))
    force = -acceleration;
    

var temp_max_speed = max_speed;
if(boost > 0 && keyboard_check(key_boost))
{
    var ex = x + lengthdir_x(20, phy_rotation + 180);
    var ey = y + lengthdir_y(20, -phy_rotation + 180);
    effect_create_above(ef_smoke, ex, ey, 0.5, choose(c_dkgray, c_gray));
    boost -= boost_consume;
    force += acceleration;
    temp_max_speed = max_speed * 2;
    boost_cooldown = room_speed * 1.5;
}

if(phy_speed < temp_max_speed && speed > -max_speed)
{
    var fx = force * dcos(phy_rotation);
    var fy = force * dsin(phy_rotation);
    physics_apply_force(x, y, fx, fy);
}

//decrease speed
if(phy_speed > 0)
{
    var speed_dir = point_direction(0, 0, phy_linear_velocity_x, phy_linear_velocity_y);
    var amount = abs(angle_difference(image_angle, speed_dir)/75);
    phy_linear_damping = max(base_damping, amount)
}
    
if(keyboard_check(vk_left))
{
    physics_apply_torque(-turn_radius);
}
else if(keyboard_check(vk_right))
{
    physics_apply_torque(turn_radius); 
}

if(boost_cooldown <= 0)
{
    boost = min(100, boost + 1);
}
else
    boost_cooldown--;

