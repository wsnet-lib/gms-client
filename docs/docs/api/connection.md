---
id: connection
title: Connection handling
sidebar_label: Connection
---


**Connect the player to the server, by specifying the address and the port:**


```js
net_connect("localhost", 8080, noone);
```

You can pass a function to the third argument, if you want to do something when the connection is established.

Example:

```js
function on_connection(connected) {
  if (!connected) show_error("Not connected", false);
}
net_connect("yourserver.com", 80, on_connection);
```

---

**Disconnect from the server:**

```js
net_disconnect();
```

---

**Detecting a network disconnection:**

WSNET is able to detect a disconnection and automatically try to reconnect the player.
The script `wsnet/events/net_on_connection_close` can be modified to handle this event.

---

**Handling errors:**

Errors are handled within the script `wsnet/events/net_on_error`. 
This function will be called also for validation errors of the other commands.
