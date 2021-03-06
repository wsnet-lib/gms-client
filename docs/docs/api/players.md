---
id: players
title: Players
sidebar_label: Players
---

All players are identified by an ID, which is assigned when joining a lobby.

The player state (id, username, lobby) is also persisted across network reconnections (by using its IP address), until the player leaves the lobby or the server is restarted.

**Available player events (wsnet/events):**

```js
net_on_player_join([ player_id, player_name ])
// When a new player joins the current connected lobby
```

```js
net_on_player_leave([ player_id, player_name ])
// When a player leaves the lobby
```

```js
net_on_player_username([ player_id, player_name ])
// When a player changes its username
```

```js
net_on_player_kickban(success, [ player_id, player_name ], kick_or_ban)
// When a player is kicked or banned. 
// The first arguments specifies if the action has been successful
// The third argument specifies the kind of event
```

You can modify these functions code to handle the events behavior.
