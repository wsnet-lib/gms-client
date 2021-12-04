
recv_buffer_size = 0;
send_buffer = buffer_create(1024, buffer_grow, 1);
recv_buffer = buffer_create(1024, buffer_grow, 1);
recv_buffer_merge = buffer_create(1024, buffer_grow, 1);
msg_buffer = buffer_create(1024, buffer_grow, 1);

packet_buffering = false;
received_header = false;

header_search[0] = 13;
header_search[1] = 10;
header_search[2] = 13;
header_search[3] = 10;

keep_alive = true;
ping_interval = 10;

enum gws_opcode 
{ 
    continuation_frame = 0,
    text_frame = 1,
    binary_frame = 2,
    non_control_frame_1 = 3,
    non_control_frame_2 = 4,
    non_control_frame_3 = 5,
    non_control_frame_4 = 6,
    non_control_frame_5 = 7, 
    connection_close = 8, 
    ping = 9, 
    pong = 10, 
    control_frame_1 = 11,
    control_frame_2 = 12,
    control_frame_3 = 13,
    control_frame_4 = 14,
    control_frame_5 = 15,
    control_frame_6 = 16
}

enum gws_error {
    connect = -1,
    send = -2,
    header_corrupted = -3
}


