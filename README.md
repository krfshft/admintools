# AdminTools

Originally intended to free up macro space, this addon eventually grow to become a set of Tools for single player MMO games played on a local server.

Essentially this is a bunch of Buttons That Do Things. The reason for buttons is that I primarily play using a gamepad, so this addon is all about exposing keyboard functionality is a convenient and intuitive way.

The intuitive part comes from the buttons always being in the same places. The panels may seem intimidating at first, being full of icons and some vague text in the tooltips, but once you learn them the fact that they don't move, can't be moved, means your muscle memory will quickly learn where they are and greatly reduce the need to reach over to a keyboard. 

Compatible with cmangos wotlk, acore 3.3.5, and praevius legion v2, 7.3.5.


## Actions Panel
1. Teleports. Contains Teleport 16 character-specific teleport buttons, and 8 more that are shared between all characters (on all accounts). Each button also has a corresponding "set" button to update that location. The buttons are named Home and Camp 1-8 but that is just a suggestion about this way, they are effectively customized waypoints. All of the teleport buttons also automatically generates a character-specific return point, so you don't have to make waypoints just to return to town and back.
2. Management. Buttons for leveling and deleveling yourself or bot allies. A button for adding talent points, buttons for killing or respawning npcs, or deleting them entirely (use with caution). Also has buttons for setting CVARS for increasing graphics quality.
3. PlayerBot, and NPCBot commands. PlayerBots is an addon for cmangos which adds thousands of bot npcs to the gameworld. NPCBots are like the junior version which creates a limited selection of human pets that you can group up with. AdminTools adds buttons for commanding your bots to kill and follow and to set PlayerBots rpg strategies. If you are not familiar with PlayerBots, I have set up simple buttons that cut down on micromanaging for bot party members. You can let them grind and sell/repair, or disable everything and turn them into effectively pets with a single click now.
4. New Character Startup buttons. I find myself setting up a lot of bots. And PlayerBots compounds the issue by having me also create multiple bot party members for each alt. These buttons address this with things like "add starter gear for wrath/legion," "add heirlooms for wrath/legion."
5. Change the weather. In order to work in AzerothCore and PraeviusCore, you will need to apply the weather.sql file from sql patches. cmangos claims you can't change weather in zones without weather records but still changes it anyways. Just a random fact.
6. Buttons some skills that can be used from other classes, such as Warlock pets (inlcuding Doomguard and Infernal!), Warlock metamorphosis, FrostPath and douse. Will add more over time.
7. GM buttons, such as Grow/Shrink, Uber heal over Time, A permanent charm that lasts until logout/travel, and engraded version of Tame Beast.
8. Random other useful buttons: toggle minimap (requires Hide_Minimap addon for 3.3.5), toggle chat window, bring up Who for current zone, any new thing that would require a keyboard to do would go here.

## Content Panel 1 "Static Panel"
1. NPC Creation buttons.  Mostly, these are meant to be practical, service NPCs, such as those for Banking, Trade and Transmog. There are also City guard type NPCs for both factions, which you can spawn at your camps to have protection from bots of the alternate faction (cmangos only), or creatures. On top of those useful NPCs I also added all the faction leaders, in case you wanted to make them fight each other. I assume everyone wants to make them do that, at least once.
2. Shop inventory buttons. These cover a lot. There are buttons for trade goods*, tier gear*, scrolls*, mounts and misc.* The mount two mounts buttons add every single mount  (up to 3.3.5, does not include >= cata), and require an SQL patch in order to give them prices.
3. Herb and Mineral nodes. Nodes created in this way respawn with a short 25 second time (at least on cmangos). 
4. Buildings. Unless you take the additional steps of creating new server side records for game objects, it is actually quite difficult to find a lot of specific things that you can spawn in. The few I've found for classic game versions have been put in here. The garrison buildings in legion can be added anywhere to the gameworld with these buttons, providing some nice options building camps on the modern game client.
5. Camp objects: Camp, Home, and Resources. This includes functional things, such as Anvil, Forge (also Black Anvil and Black Forge from BRD), and also some fairly nice-looking decorative furniture that I found valid IDs for. The camp items buttons will be expanded over time, somewhat, although there are more specialized addons that focus solely on object spawning, such as [MarsAdmin](https://github.com/sezeryldz/MarsAdmin) for TrinityCore 7.3.5. In contrast, the focus on this addon is on freeing up macro space and making things easy to do with a gamepad. 

## Content Panel 2 "Dynamic Panel" (not implemented)
One of the advantages of the Actions Panel and Content Panel 1 is that the buttons never move, so once you learn where things are, your ability to activate buttons quickly will benefit greatly. The down side is that the limited space of the panel becomes an issue, and it is only appropriate for the most commonly accessed buttons.
To expose more functions to keyboardless users, a dynamic system that lets you add and remove groups of buttons is needed.
I however have no specific plans to make it. Maybe I will, someday, but at the moment I have only the energy and time to observe that this is vaguely planned for the future.

## Config Panel (not implemented)
Part of the reason Configuration is not a priority for me, is that first goal of this mod is to reduce the efforts involved in bootstrapping new characters. So I keep this addon itself configured as I want it to be and then only have to put the addon in the interface directory and all characters in all accounts on that PC are up-to-date. So it's hard to be motivated to add features that would reintroduce character setup overhead. That said, there are a few things that would be useful to configure with a GUI, so, as with the Dynamic Content Panel: someday, maybe.

## Future Development

I make no commitments to maintain, fix or extend this. But I might, as long as there are things on this page that say "not implemented." You are welcome to submit PR's and deny me the fulfillment of developing those features, and you have my permission to fork this project for commercial or non-commercial use.


## * Completeness of this Addon
Some aspects of this addon will be completed at a slow pace. For instance, the shop inventory buttons, will only add materials and reagents up to the point in the game where I have played to. It will take quite a long time before I've covered all of the game's content at my casual pace. So things on this page marked with an asterisk are things that aren't complete now for all three supported cores (cmangos, azerothcore, praeviuscore). I'll accept PRs that complete this stuff it's just not my priority.
