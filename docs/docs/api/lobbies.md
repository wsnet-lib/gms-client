---
id: lobbies
title: Lobbies
sidebar_label: Lobbies
---

All game activity is based around lobbies, eg. a player can only send data after joining a lobby.

Lobbies can have only one admin, which is transferable to another player at any time. If the admin leaves the lobby, the first available player will be assigned as new admin.

Lobbies may have an optional password, to allow other players to join it.

The max number of connected players in a lobby is 254, but this can be limited from the admin.


### Public functions

```js
// Create a lobby (use an empty string to disable the password)
net_lobby_create(lobby_name, max_players, username, password)
```

```js
// Get the list of lobbies
net_lobby_get_list()
``` 

```js
// Join an existing lobby
net_lobby_join(lobby_id, user_name, password)
```

```js
// Join to the first available lobby without a password. The function accept 
// two arguments to sort the lobbies list (eg. to join lobbies with less players)
net_lobby_join_auto(username, date_sort, players_count_sort)
```

```js
// Leave the lobby
net_lobby_leave()
``` 

```js
// Set the player username
net_lobby_username(username)
``` 

---

### Admin functions

```js
// Specify if the lobby allows other players to join
net_lobby_allow_join(allow)
``` 

```js
// Ban a specific player (by IP)
net_lobby_ban(player_id)
```

```js
// Get the list of banned players
net_lobby_get_banned()
```

```js
// Kick a specific player
net_lobby_kick(player_id)
``` 

```js
// Specify the max players allowed to join the lobby
net_lobby_max_players(max_players)
```

```js
// Set the lobby password
net_lobby_password(password)
```

```js
// Transfer the admin to another player
net_lobby_transfer(player_id)
```

```js
// Unban a player. The argument is the hashed IP of the player returned
// from the function net_on_lobby_get_banned
net_lobby_unban(hashed_ip)
```

