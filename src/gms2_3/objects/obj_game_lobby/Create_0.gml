enum msg
{
    start,
    color,
    car_state,
    laps,
    boost,
    checkpoints,
    chat,
}

net_on(msg.car_state, on_car_state); 
net_on(msg.color, on_color);
net_on(msg.start, on_start);
net_on(msg.laps, on_laps);
net_on(msg.boost, on_boost);
net_on(msg.checkpoints, on_checkpoints);
net_on(msg.chat, on_chat);

