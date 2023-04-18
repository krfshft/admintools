# AdminTools

### What is this?
Originally intended to free up macro space, this addon eventually grew to become a set broad of tools for single player MMO games played on a local server.

Essentially this is a bunch of Buttons That Do Things. The reason for buttons is that I primarily play using a gamepad, so this addon is all about exposing keyboard functionality is a convenient and intuitive way.

The intuitive part comes from the buttons always being in the same places. The panels may seem intimidating at first, being full of icons and some vague text in the tooltips, but once you learn them the fact that they don't move means your muscle memory will quickly learn where they are and greatly reduce the need to reach over to a keyboard.

Compatible with cmangos wotlk, acore 3.3.5, and praevius legion v2, 7.3.5.

## Project Guidelines
### What is the scope
I'm not sure atm, but suggestions for new buttons will be welcomed.

## How to use
In order to map your function keys to overlay buttons, you will need these lines in your WTF/Account/NAME/bindings-cache.wtf file:
bind F1 CLICK ADMINTOOLS_1:LeftButton
bind F2 CLICK ADMINTOOLS_2:LeftButton
bind F3 CLICK ADMINTOOLS_3:LeftButton
bind F4 CLICK ADMINTOOLS_4:LeftButton
bind F5 CLICK ADMINTOOLS_5:LeftButton
bind F6 CLICK ADMINTOOLS_6:LeftButton
bind F7 CLICK ADMINTOOLS_7:LeftButton
bind F8 CLICK ADMINTOOLS_8:LeftButton
bind F9 CLICK ADMINTOOLS_9:LeftButton
bind F10 CLICK ADMINTOOLS_10:LeftButton
bind F11 CLICK ADMINTOOLS_11:LeftButton
bind F12 CLICK ADMINTOOLS_12:LeftButton
bind F13 CLICK ADMINTOOLS_13:LeftButton
bind F14 CLICK ADMINTOOLS_14:LeftButton
bind F15 CLICK ADMINTOOLS_13:LeftButton
bind F16 CLICK ADMINTOOLS_14:LeftButton
bind F17 CLICK ADMINTOOLS_17:LeftButton
bind F18 CLICK ADMINTOOLS_18:LeftButton
bind F19 CLICK ADMINTOOLS_19:LeftButton
bind F20 CLICK ADMINTOOLS_20:LeftButton
bind F21 CLICK ADMINTOOLS_21:LeftButton
bind F22 CLICK ADMINTOOLS_22:LeftButton
bind F23 CLICK ADMINTOOLS_23:LeftButton
bind F24 CLICK ADMINTOOLS_24:LeftButton

In order to use the included rewasd profile, add this line to bindings-cache.wtf:
bind ; TOGGLEMOUSELOOK


Some buttons won't work unless you have addons installed, and even then they still won't without my personal edits to other addons.
* The "Toggle Minimap" button requires the Hide_minimap() addon for 3.3.5.
* TODO: finish this list, see what dependencies and I can avoid



## Actions Panel
1. Teleports. Contains 16 character-specific teleport buttons, and 8 more that are shared between all characters (on all accounts). Each button also has a corresponding "set" button to update that location. The buttons are named Home and Camp 1-8 but that is just a suggestion about the way they can be used, they are effectively all custom waypoints. All of the teleport buttons also automatically generate a character-specific return point, so you don't have to make waypoints just to return to town and back.
2. Management. Buttons for leveling and deleveling yourself or other players. A button for adding talent points, buttons for killing or respawning npcs, or deleting them entirely (use with caution). Also has buttons for setting CVARS for increasing graphics quality.
3. PlayerBot, and NPCBot commands. PlayerBots is an addon for cmangos which adds thousands of bot players to the gameworld. NPCBots are like the junior version which creates a limited selection of playable-race pets that you can group up with. AdminTools adds buttons for commanding your bots to kill and follow and to set PlayerBots rpg strategies.
4. New Character Startup buttons. I find myself setting up a lot of alts. And PlayerBots compounds the issue by having me also create multiple bot party members for each alt. These buttons address this with things like "add starter gear for wrath/legion," "add heirlooms for wrath/legion."
5. Change the weather. In order to work in AzerothCore and PraeviusCore, you will need to apply the weather.sql file from sql patches. cmangos claims you can't change weather in zones without weather records but still changes it anyways.
6. Button some skills that can be used from other classes, such as Warlock pets (inlcuding Doomguard and Infernal!), Warlock metamorphosis, FrostPath and douse. Will add more over time.
7. GM buttons, such as Grow/Shrink, Uber heal over Time, A permanent Charm spell that lasts until logout/travel, and an upgraded version of Tame Beast.
8. Random other useful buttons: toggle minimap (requires Hide_Minimap addon for 3.3.5), toggle chat window, bring up Who for current zone, any new thing that would require a keyboard to do would go here.

## Content Panel 1 "Static Panel"
1. NPC Creation buttons.  Mostly, these are meant to be practical: service NPCs, such as those for Banking, Trade and Transmog. There are also City Guard type NPCs for both factions, which you can spawn at your camps to have protection from bots of the opposite faction (cmangos only), or creatures. On top of those useful NPCs I also added all the faction leaders, in case you wanted to make them fight each other. I assume everyone wants to make them do that, at least once.
2. Shop inventory buttons. These cover a lot. There are buttons for trade goods*, tier gear*, scrolls*, mounts and misc.* The two mounts buttons add every single mount  (up to 3.3.5, does not include >= cata), and I have included an optional SQL patch if you want to give them prices.
3. Herb and Mineral nodes. Nodes created in this way respawn with a short 25 second time (at least on cmangos). 
4. Buildings. Unless you take the additional steps of creating new server side records for game objects, it is actually quite difficult to find a lot of specific things that you can spawn in. The few buildings I've found for classic game versions have been put in here. The garrison buildings in legion can be added anywhere to the gameworld with these buttons, providing some nice options for building camps on the modern game client.
5. Camp objects: Camp, Home, and Resources. This includes functional things, such as Anvil, Forge (also Black Anvil and Black Forge from BRD), and also some fairly nice-looking decorative furniture that I found valid IDs for. The camp items buttons will be expanded over time, somewhat, although there are more specialized addons that focus solely on object spawning, such as [MarsAdmin](https://github.com/sezeryldz/MarsAdmin) for TrinityCore 7.3.5. In contrast, the focus on this addon is on freeing up macro space and making things easy to do with a gamepad. 
6. Game Object adjustments. Currently it has the ability to delete the nearest game object, and ability to delete the most recently added game object. Even if you are using a keyboard, if you want to create a camp in the wilderness these buttons are indispensable. I plan to add controls to let you rotate and move already placed objects, so you don't have to keep deleting/recreating until get you the positioning right, but as with all aspects of future development, I make no promises. 

![DeleteObj](https://i.imgur.com/ZhhDLh2.png)


## Overlay
24 buttons which are intended to mapped to function keys 1-24. There overlay has two important reasons for existing: buttons that are mapped, that you can subsequently  


## Content Panel 2 "Dynamic Panel" (not implemented)
One of the advantages of the Actions Panel and Content Panel 1 is that the buttons never move, so once you learn where things are, your ability to activate buttons quickly will benefit greatly. The down side is that the limited space of the panel becomes an issue, and it is only appropriate for the most commonly accessed buttons.
To expose more functions to keyboardless users, a dynamic system that lets you add and remove groups of buttons is needed.
However I have no specific plans to make it. Maybe I will, someday, but at the moment I will only share that this is vaguely planned for the future.

## Config Panel (not implemented)
For this project I prefer to keep the configuration in the code, but for customizing cross-class spells and talents, that just won't work. So eventually I plan to implement configuration settings and just keep my preferences as defaults. 


![Actions Panel](https://i.imgur.com/gNVbxyo.jpg)
![Content Panel](https://i.imgur.com/hAm9lKb.jpg)

## * Completeness of this Addon
I make no commitments to maintain, fix or extend this. But I probably will, as long as there are things on this page that say "not implemented." 

## Contributions and License
If you want to complete any of the unimplemented systems I have outlined here you are welcome to. Please follow the existing code formatting conventions, use real tabs, and... if you can manage it, try not to make work for me. You are welcome to submit Pull Requests, I may or may not review them in a timely manner. If you want new functionality you have my permission to fork the project for commercial and non-commercial use.

## Roadmap
Some aspects of the data will be completed but at a very slow pace. For instance, the shop inventory buttons, will only add materials and reagents up to the point in the game where I have played to. It will take quite a long time before I've covered all of the game's content at my extremely slow pace. So things on this page marked with an asterisk are things that aren't complete now for all three supported cores (cmangos, azerothcore, praeviuscore). I'll accept PRs that complete this stuff it's just not my priority.

Apart from the data, new features I would like to do someday are, in no particular order:

* I want support cross class skills for skills that have multiple levels. Doing that with the code currently would give you rank 10 skills at level 1, which is a bit much, so I want to add a system that only adds spells learnable up to the characters currently level.
* I want to be able to choose cross class skills and talents. Currently all cross class talents are applied automatically on login, but I want to be able to make custom multiclass builds that are different for each character, which makes implementation of the Config panel a blocker for this.
* Complete all the shop inventory buttons.
* Convert all of the camp building buttons to a data driven system. It's not bad the way it is now, and will be functionally identical, but the code will be a little leaner and nicer.
* Collect the IDs from all user-created gameobjects within a certain range, filter out non-user spawned objects, then pass this data to a python (or js maybe) tool that pulls the records from the database and stores in an agnostic format. The goal being to allow a camp to be created in one core and then imported into any supported core. Once that is in place, I can safely devote more time into creating awesome camps, knowing they will never be lost, and I will have the option of synchronizing builds across all three systems.
* Make it clearer in the interface which buttons apply to which cores. Converting buttons to a data driven system is a blocker for this, because which buttons support which cores will be defined with the rest of the button data.
* In addition to the character-bootstrapping features that exist in the Actions panel, I would like to add a function to automatically write configuration settings for other addons. When you have a lot of alts, getting all of their settings dialed in just right is quite the nuisance. Ideally this addon for fully setup everything I want on a fresh character on login, without any other action, but from the limited examination I have done of this problem, it has fussy nuisance written all over it. So who knows.


## Known Issues (apart from things marked unimplemented)
1. Make the keymappings appear in the keybinding panel on 3.3.5 and 7.3.5 (will require branching code, the methods are different).
