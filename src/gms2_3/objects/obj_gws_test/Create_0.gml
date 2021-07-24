var connected = net_connect("localhost", 8080, noone);

if(!connected)
{
    show_message("can't connect!");
}

messages = ds_list_create();

draw_set_font(fnt_pixel);

enum msg_test
{
    buffer,
    chat,
    dsmap,
    dslist,
}

net_on(msg_test.chat, test_msg_log); 
net_on(msg_test.buffer, test_msg_log_buffer);
net_on(msg_test.dsmap, test_msg_log_map); 
net_on(msg_test.dslist, test_msg_log_map); 

