
var state = array_create(5);
state[0] = x;
state[1] = y;
state[2] = speed;
state[3] = phy_rotation;
state[4] = boost > 0 && keyboard_check(key_boost);
net_send_number_array(msg.car_state, all, state);

alarm[0] = 3;

