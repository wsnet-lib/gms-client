if(charged)
{
    draw_self();
    if(point_distance(x, y, obj_car.x, obj_car.y) < 16)
    {
        obj_car.boost = min(100, obj_car.boost + 10);
        charged = false;
        alarm[0] = room_speed * 5;
        net_send_byte(msg.boost, all, my_id);
    }
}


