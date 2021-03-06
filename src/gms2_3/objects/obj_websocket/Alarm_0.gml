/// @description send ping 
if(!keep_alive)
{
    gws_on_connection_close();
    instance_destroy();
    exit;
}

//set the 
keep_alive = false;

buffer_seek(send_buffer, buffer_seek_start, 0);

var bitmask = (1 << 7) | gws_opcode.ping;
buffer_write(send_buffer, buffer_u8, bitmask);

var mask = 0; 
buffer_write(send_buffer, buffer_u8, mask | 0);
network_send_raw(socket, send_buffer, 2); //send 2 bytes

alarm[0] = room_speed * ping_interval;

