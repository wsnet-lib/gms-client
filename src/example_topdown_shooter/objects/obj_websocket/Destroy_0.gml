/// @description free memory
network_destroy(socket); 
buffer_delete(send_buffer);
buffer_delete(recv_buffer);
buffer_delete(msg_buffer);

if(debug_mode)
    show_debug_message("Destroyed websocket");


