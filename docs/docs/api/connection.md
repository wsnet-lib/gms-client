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

Example 1 (Regular function):

```js
function on_connection(connected) {
  if (!connected) show_error("Not connected", false);
}
net_connect("yourserver.com", 80, on_connection);
```

Example 2 (Anonymous function):

```js
net_connect("yourserver.com", 80, function (connected) {
  if (!connected) show_error("Not connected", false);
});
```

---

**Disconnect from the server:**

```js
net_disconnect();
```
