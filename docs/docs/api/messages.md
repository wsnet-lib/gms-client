---
id: messages
title: Send and receive data
sidebar_label: Send and receive data
---

### Send

WSNET provides several functions to send data to the other players. 

**All send functions accept these 3 arguments:**

`msg_id` - The message ID. You will use this to identify the kind of message received from a player. 

`player_id` - The ID of the player which to send the message (use 255 to send to all lobby players).

`data` - Data to send (string/number/array/buffer/etc).

For example, if you want to send a chat message to a player.

```js
net_send_string(0, 12, "Hello world!");
// 0 is defined by you to understand the kind of data, in this case a 'chat message'.
```

---

**The full list of the available functions:**

- `net_send()` - Buffer
- `net_send_string()` - String
- `net_send_string_array()` - Array of strings
- `net_send_number()` - Number
- `net_send_number_array()` - Array of numbers
- `net_send_byte()` - Byte
- `net_send_byte_array()` - Array of bytes
- `net_send_array()` - Array of numbers/strings/booleans/int64
- `net_send_list()` - List of numbers/strings/booleans/int64
- `net_send_map()` - Map of numbers/strings/booleans/int64

---

### Receive

**Listen for incoming messages:**

```js
net_on(msg_id, callback);
```

This will register a callback function for the specific message ID, that will be executed every time the player receives a message.

Example:

```js
function on_message(player_id, message) {
  show_debug_message(string(player_id) + " sent a message: " + message);
};
net_on(0, on_message);
// This will register the callback for all the messages with ID 0
```
