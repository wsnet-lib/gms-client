---
id: events
title: Events
sidebar_label: Events
---

Using the `net_event` function, you can register a callback for an event.


### Detecting a network disconnection

You can register an event to detect a disconnection and automatically try to reconnect the player.

```js
net_event(wsnet_evt.connection_close, function()
{
	show_debug_message("Connection closed by the server.");
	show_message("Connection closed by the server.");
});
```

---


### Handling errors

To handle errors, you can register a callback for the `wsnet_evt.error` event.

```js
net_event(wsnet_evt.error, function(error_code, error) 
{
	show_message(string(error_code) + " |" + net_decode_error(error)); 
});
```
Error Codes:  `no_error`, `command_not_found`, `player_not_found`, `lobby_not_found`, `unauthorized`, `wrong_password`, `max_lobby_players`, `input_validation_failed`, `already_in_lobby`, `server_error`, `callback_not_found`, `incorrect_type`

---


### Lobby events

Receive a response from the server saying if your lobby has been created or not.
```js
net_event(wsnet_evt.lobby_create, function (success, lobby_id) 
{
	if(success)
	{
		show_debug_message("created lobby: " + string(lobby_id));
	}
	else
	{
		show_debug_message("Error creating lobby: " + net_decode_error(global.net_error_id));
	}
});
```

---

Receive a response from the server saying if your successfully joined a lobby.
```js
net_event(wsnet_evt.lobby_join, function (success)
{
	if(success)
	{
		show_debug_message ( 
		    "[JOINED] lobby id: " + string(global.net_lobby_id) + ", " +
		    "player id: " + string(global.net_player_id)
		);
	}
	else
	{
		show_debug_message("Error, can't join:  " + net_decode_error(global.net_error_id));
	}
});
```

---

Receive a response from the server with the lobbies list (stored in `global.net_lobbies`).
```js
net_event(wsnet_evt.lobby_get_list, function()
{
	var lobbies = global.net_lobbies;

	var sz = ds_list_size(lobbies);
	for(var i = 0; i < sz; i++)
	{
		var lobby = lobbies[| i];
		//var lobby_id = lobby[0];
		//var lobby_name = lobby[1];
		//var lobby_players = lobby[2];
		//var lobby_max_players = lobby[3];
		//var lobby_has_password = lobby[4];
    
		show_debug_message(lobby);
	}
});
```

---

Receive a response from the server saying if you left the lobby successfully.
```js	
net_event(wsnet_evt.lobby_leave, function (success)
{
	if(success)
	{
		show_debug_message("lobby left successfully");
	}
	else
	{
		show_debug_message("Error, can't leave: " + net_decode_error(global.net_error_id));
	}
});
```

---


Receive a response from the server saying if the `Allow Join` flag has been updated successfully.
```js		
net_event(wsnet_evt.lobby_allow_join, function(success, allow) 
{
	if(success)
	{ 
		show_debug_message("Lobby allow join changed successfully: " + string(allow));
	}
	else
	{
		show_debug_message("Error, can't change allow join: " + net_decode_error(global.net_error_id));
	}
});
```

---

Receive a response from the server saying if the max number of players that can join has been updated successfully.
```js
net_event(wsnet_evt.lobby_max_players, function(success, max_players)
{
	if(success)
	{
		show_debug_message("Max players changed successfully: " + string(max_players));
	}
	else
	{
		show_debug_message("Error, can't change max players: " +net_decode_error(global.net_error_id));
	}
});
```

---

Receive a response from the server saying if the lobby password has been updated successfully.
```js
net_event(wsnet_evt.lobby_password, function(success) 
{
	if(success)
	{
		show_debug_message("Password changed successfully");
	}
	else
	{
		show_debug_message("Error, can't change password: " + net_decode_error(global.net_error_id));
	}
});
```

---

Receive a response from the server saying if the lobby has been transfered to another player successfully.
```js
net_event(wsnet_evt.lobby_transfer, function(success, new_admin_id) 
{
	if(success)
	{
		show_debug_message("Admin transfered to id [" + string(new_admin_id) +"]");
	}
	else
	{
		show_debug_message("Error, can't transfer: " + net_decode_error(global.net_error_id));
	}
});
```

---

Receive a response from the server saying if the player has been unbanned successfully.
```js
net_event(wsnet_evt.lobby_unban, function(success, short_hash) 
{ 
	if(success)
	{
		//successfully changed
		show_debug_message("Player unbanned successfully: " + string(short_hash));
	}
	else
	{
		show_debug_message("Error, can't unban: " +net_decode_error(global.net_error_id));
	}
});
```

---

Receive a response from the server with the banned player list (Each player is associated to a short hash, that can be used to unban them)
```js
net_event(wsnet_evt.lobby_get_banned, function (success, banned_players) 
{
	if(success)
	{
		var sz = array_length(banned_players);
		var str = "";
		for(var i = 0; i < sz; i++)
		{
		    var player = banned_players[i];
		    var shortid = player[0];
		    var player_name = player[1];
		    str += shortid + ": " + player_name + " | ";
		}
		show_debug_message(str);
	}
	else
	{
		show_debug_message("Error, can't get banned list: " + net_decode_error(global.net_error_id));
	}
});
```
---

### Players events

Receive a message from the server saying that a new player joined the lobby.

```js	
net_event(wsnet_evt.player_join, function(player) 
{
	var player_id = player[0];
	var player_name = player[1];

	show_debug_message("player joined " + player_name + "["+string(player_id)+"]");
});
```

---

Receive a message from the server saying that a player left the lobby.
```js	
net_event(wsnet_evt.player_leave, function(player) 
{
	var _player_id = player[0];
	var player_name = player[1];

	show_debug_message("player left " + player_name + "["+string(_player_id)+"]");
});
```

---

Receive a message from the server saying that a player has been kicked or banned from your lobby.
```js
net_event(wsnet_evt.player_kickban, function(success, player, banned)
{
	if(success)
	{
		var player_id = player[0];
		var player_name = player[1];
    
		if(banned)
		    show_debug_message("Player banned: " + player_name + "["+string(player_id)+"]");
		else
		    show_debug_message("Player kicked: " + player_name + "["+string(player_id)+"]");
	}
	else
	{
		show_debug_message("Error, can't kickban: " + net_decode_error(global.net_error_id));
	}
});
```

---

Receive a message from the server saying that a player changed username.
```js	
net_event(wsnet_evt.player_username, function(success, player) 
{
	if(success)
	{
		var player_id = player[0];
		var player_name = player[1];
    
		show_debug_message("player changed name " + player_name + "["+string(player_id)+"]");
	}
	else
	{
		show_debug_message("Error, can't change allow join: " + net_decode_error(global.net_error_id));
	}
});
```