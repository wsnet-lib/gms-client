/// @description receive packets

var buffer = async_load[? "buffer"];
var buffer_size = async_load[? "size"];

if(async_load[? "id"] == socket)
{
    
    var target_buffer, target_buffer_size;
    
    //if waiting part of the message
    if(packet_buffering)
    {
        packet_buffering = false;
        
        if(debug_mode)
            show_debug_message("> Packet Part received: concat buffers");
        
        //reset merge buffer
        buffer_seek(recv_buffer_merge, buffer_seek_start, 0);
        
        //copy recv_buffer (the previous bitstreams) 
        buffer_copy(
            recv_buffer, 0, recv_buffer_size,
            recv_buffer_merge, 0
        );
        
        //copy current buffer (the current bitstream received)
        buffer_copy(
            buffer, 0, buffer_size,
            recv_buffer_merge, recv_buffer_size
        );
            
        //reset the previous recv buffer
        buffer_seek(recv_buffer, buffer_seek_start, 0);
        
        target_buffer = recv_buffer_merge;
        target_buffer_size = recv_buffer_size + buffer_get_size(buffer); 
    }
    else
    {
        if(debug_mode)
            show_debug_message("> New packet received");
        target_buffer = buffer;
        target_buffer_size = buffer_get_size(buffer);
    }
     
    if(!received_header)
    {
        buffer_seek(target_buffer, buffer_seek_start, 0);
       
         
        //search for header
        var idx = 0;  
        var header = "";
        var found = false;
        for(var i = 0; i < target_buffer_size; i++)
        {
            var byte = buffer_read(target_buffer, buffer_u8);
            if(byte == header_search[idx])
            {
                idx++;
                if(idx >= 4)
                {
                    header += chr(byte);
                    found = true;
                    break;
                }
            }
            else
                idx = 0;
            header += chr(byte);
        }
        
        
        //keep waiting for header
        if(!found)
        {
            if(target_buffer_size < 4096)
            {
                //copy to recv_buffer
                buffer_copy(
                    target_buffer, 0, target_buffer_size,
                    recv_buffer, 0
                );
                recv_buffer_size = target_buffer_size;
                packet_buffering = true;
                if(debug_mode)
                    show_debug_message("connection header partially received, waiting...");
                return false;
            }
            else 
            {
                if(debug_mode)
                    show_debug_message("can't find header end: too long");
                gws_on_error(gws_error.header_corrupted);
                return false;
            }
        }
            
        received_header = true;
        if(string_pos("Accept", header) != 0)
        {
            gws_on_accept();
        }
        else
        {
            gws_on_refuse();
            instance_destroy();
            exit;
        }
    
    }
    
    //read the target_buffer
    var tell = buffer_tell(target_buffer);
    if(tell >= target_buffer_size)
    {
        if(debug_mode)
            show_debug_message("packet fully read (tell: " + string(tell) + ", size: " + string(target_buffer_size) + ")");
        return true;
    }
    
    //read the stream until it reaches the end
    while(true)
    {
        var remaining = target_buffer_size - buffer_tell(target_buffer);
        
        if(remaining >= 2)
        {
            var frame_offset = buffer_tell(target_buffer);
            var bitmask = buffer_read(target_buffer, buffer_u8);
            var fin = (bitmask >> 7) & 1;
            var rsv1 = (bitmask >> 6) & 1;
            var rsv2 = (bitmask >> 5) & 1;
            var rsv3 = (bitmask >> 4) & 1;
            var opcode = bitmask & 15;
            
            if(debug_mode)
            {
                show_debug_message("----");
                show_debug_message("fin:" + string(fin));
                show_debug_message("rsv1:" + string(rsv1));
                show_debug_message("rsv2:" + string(rsv2));
                show_debug_message("rsv3:" + string(rsv3));
                show_debug_message("opcode:" + string(opcode));
                show_debug_message("----");
            }
            
            var bitmask = buffer_read(target_buffer, buffer_u8);
            var mask = (bitmask >> 7) & 1; 
            var payload_length = bitmask & 127;
            
            if(debug_mode)
                show_debug_message("mask:" + string(mask));
        
    
            if(payload_length == 126)
            {
                if(remaining < 4)
                {
                    //packet received partially, stop and wait
                    if(debug_mode)
                        show_debug_message("payload header partially received, waiting...");
                    //copy to recv_buffer
                    buffer_copy(
                        target_buffer, frame_offset, target_buffer_size - frame_offset,
                        recv_buffer, 0
                    );
                    recv_buffer_size = target_buffer_size;
                    packet_buffering = true;
                    exit;
                }
                
                payload_length = (buffer_read(target_buffer, buffer_u8) << 8 ) | buffer_read(target_buffer, buffer_u8) 
                if(debug_mode)
                    show_debug_message("payload_length_medium:" + string(payload_length));
            }
            else
            { 
                if(debug_mode)
                    show_debug_message("payload_length_small:" + string(payload_length));
            }
                    
            var remaining = target_buffer_size - buffer_tell(target_buffer);
            if(remaining < payload_length)
            {
                //packet received partially, stop and wait
                if(debug_mode)
                    show_debug_message("payload_length:" + string(payload_length));
                //copy to recv_buffer
                recv_buffer_size = target_buffer_size - frame_offset;
                buffer_copy(
                    target_buffer, frame_offset, recv_buffer_size,
                    recv_buffer, 0
                );
                packet_buffering = true;
                exit;
            }
            if(debug_mode)
                show_debug_message("copy: buffer_tell = " + string(buffer_tell(target_buffer)));
            buffer_resize(msg_buffer, payload_length);
            buffer_seek(msg_buffer, buffer_seek_start, 0);
            buffer_copy(
                target_buffer, buffer_tell(target_buffer), payload_length,
                msg_buffer, 0
            );
            
            if(opcode == gws_opcode.connection_close)
            {
                gws_on_connection_close(); 
                network_destroy(socket); 
                instance_destroy();
                exit;
            }
            else if(opcode == gws_opcode.ping) 
            {
                gws_on_ping(msg_buffer);
                
                //send pong 
                buffer_seek(send_buffer, buffer_seek_start, 0);
                
                var bitmask = (1 << 7) | gws_opcode.pong;
                buffer_write(send_buffer, buffer_u8, bitmask);
                
                var mask = 0; 
                buffer_write(send_buffer, buffer_u8, mask | 0);
                network_send_raw(socket, send_buffer, 2); //send 2 bytes
            }
            else if(opcode == gws_opcode.pong) 
            {
                gws_on_pong(msg_buffer);
                
                keep_alive = true;
            }
            else
                gws_on_receive(msg_buffer);
            
            
            //check if there are extra bytes
            var remaining = target_buffer_size - (buffer_tell(target_buffer) + payload_length);
            if(remaining > 0)
            { 
                buffer_seek(target_buffer, buffer_seek_relative, payload_length);
                if(debug_mode)
                {
                    show_debug_message("buffer_tell: "  +string(buffer_tell(target_buffer)));
                    show_debug_message("target_buffer_size: "  +string(target_buffer_size));
                    show_debug_message("remaining: "  +string(remaining));
                }
            }
            else
            {
                if(debug_mode)
                {
                    if(remaining < 0)
                        show_debug_message("ERROR NEGATIVE REMAINING: " + string(remaining));
                        
                    show_debug_message("-----Message fully received-----");
                }
                break;
            }
        }
    }
}



