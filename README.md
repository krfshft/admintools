
# AdminTools

### What is this?
Originally intended to free up macro space, this addon eventually grew to become a broad set of tools for single player MMO games played on a local server.

Essentially this is a bunch of Buttons That Do Things. The reason for buttons is that I primarily play using a gamepad, so this addon is all about exposing keyboard functionality in a convenient and intuitive way.

The intuitive part comes from the buttons always being in the same places. The panels may seem intimidating at first, being full of icons and some vague text in the tooltips, but once you learn them the fact that they don't move means your muscle memory will quickly learn where they are and greatly reduce the need to reach over to a keyboard.

Compatible with cmangos wotlk, acore 3.3.5, and praevius legion v2, 7.3.5.

## Project Guidelines
### What is the scope
I'm not sure atm, but suggestions for new buttons will be welcomed.


## Actions Panel
1. Teleports. Contains 16 character-specific teleport buttons, and 8 more that are shared between all characters (on all accounts). Each button also has a corresponding "set" button to update that location. The buttons are named Home and Camp 1-8 but that is just a suggestion about the way they can be used, they are effectively all custom waypoints. All of the teleport buttons also automatically generate a character-specific return point, so you don't have to make waypoints just to go to town and back.
2. Management. Buttons for leveling and deleveling yourself or other players. A button for adding talent points, buttons for killing or respawning npcs, or deleting them entirely (use with caution). Also has buttons for setting CVARS for increasing graphics quality.
3. PlayerBot, and NPCBot commands. PlayerBots is an addon for cmangos which adds thousands of bot players to the gameworld. NPCBots are like the junior version which creates a limited selection of playable-race pets that you can group up with. AdminTools adds buttons for commanding your bots to kill and follow and to set PlayerBots rpg strategies.
4. New Character Startup buttons. I find myself setting up a lot of alts. And PlayerBots compounds the issue by having me also create multiple bot party members for each alt. These buttons address this with things like "add starter gear for wrath/legion," "add heirlooms for wrath/legion."
5. Change the weather. In order to work in AzerothCore and PraeviusCore, you will need to apply the weather.sql file from sql patches. cmangos claims you can't change weather in zones without weather records but still changes it anyways.
6. Button some skills that can be used from other classes, such as Warlock pets (including Doomguard and Infernal!), Warlock Metamorphosis, FrostPath and a Douse button to disable Immolation aura (which I need because I set the duration of Immolation Aura to infinite in my server). Will add more over time.
7. GM buttons, such as Grow/Shrink, Uber Heal Over Time, a permanent Charm spell that lasts until logout/travel, and an upgraded version of Tame Beast.
8. Random other useful buttons: toggle minimap (requires Hide_Minimap addon for 3.3.5), toggle chat window, bring up Who for current zone, any new thing that would require a keyboard to do would go here.

## Content Panel 1 "Static Panel"
1. NPC Creation buttons.  Mostly, these are meant to be practical: service NPCs, such as those for Banking, Trade and Transmog. There are also City Guard type NPCs for both factions, which you can spawn at your camps to have protection from bots of the opposite faction (cmangos only), or creatures. On top of those useful NPCs I also added all the faction leaders, in case you wanted to make them fight each other. I assume everyone wants to make them do that, at least once.
2. Shop inventory buttons. These cover a lot. There are buttons for trade goods*, tier gear*, scrolls*, mounts and misc.* The two mounts buttons add every single mount  (up to 3.3.5, does not include >= cata), and I have included an optional SQL patch if you want to give them prices.
3. Herb and Mineral nodes. Nodes created in this way respawn with a short 25 second time (at least on cmangos). 
4. Buildings. Unless you take the additional steps of creating new server side records for game objects, it is actually quite difficult to find a lot of specific things that you can spawn in. The few buildings I've found for classic game versions have been put in here. The garrison buildings in legion can be added anywhere to the gameworld with these buttons, providing some nice options for building camps on the modern game client.
5. Camp objects: Camp, Home, and Resources. This includes functional things, such as Anvil, Forge (also Black Anvil and Black Forge from BRD), and also some fairly nice-looking decorative furniture that I found valid IDs for. The camp items buttons will be expanded over time, somewhat, although there are more specialized addons that focus solely on object spawning, such as [MarsAdmin](https://github.com/sezeryldz/MarsAdmin) for TrinityCore 7.3.5. In contrast, the focus of this addon is on freeing up macro space and making things easy to do with a gamepad. 
6. Game Object adjustments. Currently it has the ability to delete the nearest game object, and ability to delete the most recently added game object. Even if you are using a keyboard, if you want to create a camp in the wilderness these buttons are indispensable. I plan to add controls to let you rotate and move already placed objects, so you don't have to keep deleting/recreating until get you the positioning right, but as with all aspects of future development, I make no promises. 

![DeleteObj](https://i.imgur.com/ZhhDLh2.png)


## Overlay
The overlay makes it so you can have buttons mapped to functions that are likely to be common across most or all of your roster. Before I made the overlay I had to add macro versions of it's actions to every single character I made.

The overlay is meant to work with the button mappings in the rewasd profile and bindings-cache.wtf files included in this repo. Not all 24 buttons are mapped, but the most important ones are:
* Open Content Panel F1
* Open Actions Panel F2
* Respawn Targeted Creature F3
* Change weather to Light Rain F4
* Enable GM Mode and Flying F5
* Disable GM Mode and Flying F6
* Set speed: Slow Walk F7
* Set speed: Normal Walk F8
* Set speed: Fast Walk F9
* Set speed: Jog F10 (this is default movespeed)
* Set speed: Dash F11 (run very fast)
* Uber Stealth: F12

Currently the rest of the overlay buttons are not mapped and are only activated by clicking. Still a useful upgrade for playing with gamepad but it's the mappings that really make it.
![Overlay](https://i.imgur.com/jjO8pBQ.png)


![Actions Panel](https://i.imgur.com/gNVbxyo.jpg)
![Content Panel](https://i.imgur.com/hAm9lKb.jpg)

## How to use
You can map the 24 buttons on the overlay in the keybind menu. 



