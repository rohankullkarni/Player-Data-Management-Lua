# Player-Data-Management-Lua
Data and Character Management in Lua
This project demonstrates how to retrieve and update player information and character data using an API in Lua. It is designed for game development environments (such as RB Studio,L2D or Lua-based servers) where player data must be securely fetched, modified, and synchronized with an external or internal API.his project explores the use of HTTP-based APIs in Roblox to retrieve player information and update character attributes efficiently and securely.he system integrates Roblox DataStore APIs, RemoteEvents, and server-side scripting to synchronize leaderboard-based character selection with persistent player data. Player inventory and character choices are stored securely and restored automatically across game sessions.

1)The system focuses on:
--
Fetching player data from an API

Updating character stats and attributes

Ensuring data consistency between client, server, and API

Handling API responses and errors safely

------------------------------------------------------------

2)Objectives
--
The objectives of this project are:

To retrieve saved player inventory and character data when a player joins the game

To update character selection dynamically using leaderboard-based input

To persist player data securely using Roblox DataStores

To demonstrate client–server communication using RemoteEvents and BindableEvents

To ensure consistency between in-game character state and stored data

------------------------------------------------------------------------------------------




3)Methodology
--
3.1 Player Data Retrieval

When a player joins the game:

The PlayerAdded event is triggered

A unique DataStore key is generated using the player’s UserId

Stored inventory data is retrieved using GetAsync

The inventory values are restored

Character selection signals are sent to the client

If no data exists, default values are assigned.



--------------------------------------------------------------------
3.2 Character Selection via Leaderboard

When a player selects a character from the leaderboard:

The client sends the selected value to the server

Existing character instances are cleared

The chosen character is cloned from ServerStorage.Characters

The new character is stored in StarterPlayer.CharacterSave

Updated inventory data is saved to the DataStore
