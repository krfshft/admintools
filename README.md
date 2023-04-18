
# AdminTools

### What is this?
Originally intended to free up macro space, this addon eventually grew to become a set broad of tools for single player MMO games played on a local server.

Essentially this is a bunch of Buttons That Do Things. The reason for buttons is that I primarily play using a gamepad, so this addon is all about exposing keyboard functionality is a convenient and intuitive way.

The intuitive part comes from the buttons always being in the same places. The panels may seem intimidating at first, being full of icons and some vague text in the tooltips, but once you learn them the fact that they don't move means your muscle memory will quickly learn where they are and greatly reduce the need to reach over to a keyboard.

Compatible with cmangos wotlk, acore 3.3.5, and praevius legion v2, 7.3.5.

## Project Guidelines
### What is the scope
I'm not sure atm, but suggestions for new buttons will be welcomed.


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
The overlay makes it so you can have buttons mapped functions that are likely to be common across every single character that you play. If I didn't have the overlay I would be adding macro versions of it's actions to every single character I create.

The overlay is meant to work with the button mappings in the rewasd and bindings-cache.wtf files included in this repo. Not all 24 buttons are mapped, but the most important ones are:
* Open Actions Panel F1
* Open Content Panel F2
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

## Content Panel 2 "Dynamic Panel" (not implemented)
One of the advantages of the Actions Panel and Content Panel 1 is that the buttons never move, so once you learn where things are, your ability to activate buttons quickly will benefit greatly. The down side is that the limited space of the panel becomes an issue, and it is only appropriate for the most commonly accessed buttons.
To expose more functions to keyboardless users, a dynamic system that lets you add and remove groups of buttons is needed.
However I have no specific plans to make it. Maybe I will, someday, but at the moment I will only share that this is vaguely planned for the future.

## Config Panel (not implemented)
For this project I prefer to keep the configuration in the code, but for customizing cross-class spells and talents, that just won't work. So eventually I plan to implement configuration settings and just keep my preferences as defaults. 


![Actions Panel](https://i.imgur.com/gNVbxyo.jpg)
![Content Panel](https://i.imgur.com/hAm9lKb.jpg)

## How to use
In order to map your function keys to overlay buttons, you will need these lines in your WTF/Account/NAME/bindings-cache.wtf file:\
```
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
```
In order to use the included rewasd profile, add this line to bindings-cache.wtf:\
bind ; TOGGLEMOUSELOOK

### The rewasd FPS playstyle
The included rewasd file is optional, and only needed if you want to be ale to map overlay buttons to a gamepad. 

With the keymappings in place, I play the game similarly to how I would play Skyrim or ESO, In first person mode, with a minimalistic UI, and using a much slower speed most of the time. That is why I have different speeds setup as actions and mapped to the gamepad. The mapping scheme is explained further at the end of this file.

Because the movement stick is not sensitive (it's either all of nothing with movement, you can't walk slow by only moving the stick a little bit) I wanted to be able to set my walking speed at any time, easily. As a result of not being able to control speed with the stick, I use autorun with different walking speeds to get around most of the time.

In order to aim the camera smoothly, and also get rid of the cursor, I have an addon called MouserlookHandler, and the rewasd profile is designed around it being played in mouse look mode nearly 100% of the time.  There is an impressive gamepad addon called ConsolePort, but it is not compatible with older game client versions. By configuring the client myself and using rewasd, I can use the exactly same addon configuration on my pc and steam deck, with game versions 3.3.5 or 7.3.5, completely seamlessly.

For instance, if you have mouse look activated, you can still use all your bound hotkeys to fight mobs. And when it's time to look, the right shoulder button is a combo macro that exits mouselook mode, right clicks the mob to autocollect all look, then reenters mouselook mode, all with one button press.

The complete key mapping scheme is listed at the bottom of this document.


## * Completeness of this Addon
I make no commitments to maintain, fix or extend this. But I probably will, as long as there are things on this page that say "not implemented." 

## Contributions and License
If you want to complete any of the unimplemented systems I have outlined here you are welcome to. Please follow the existing code formatting conventions, use real tabs, and... if you can manage it, try not to make work for me. You are welcome to submit Pull Requests, I may or may not review them in a timely manner. If you want new functionality you have my permission to fork the project for commercial and non-commercial use.

## Roadmap
Some aspects of the data will be completed but at a very slow pace. For instance, the shop inventory buttons, will only add materials and reagents up to the point in the game where I have played to. It will take quite a long time before I've covered all of the game's content at my extremely slow pace. So things on this page marked with an asterisk are things that aren't complete now for all three supported cores (cmangos, azerothcore, praeviuscore). I'll accept PRs that complete this stuff it's just not my priority.

Apart from the data, new features I would like to do someday are, in no particular order:

* Support cross class skills for skills that have multiple levels. Doing that with the code currently would give you rank 10 skills at level 1, which is a bit much, so I want to add a system that only adds spells learnable up to the characters currently level.
* Clean up BuildOverlay():
	* Simplify function signature
	* Make buttons data driven, with support for configurable icon/grid size
* Ability to choose cross class skills and talents. Currently all cross class talents are applied automatically on login, but I want to be able to make custom multiclass builds that are different for each character, which makes implementation of the Config panel a blocker for this.
* Complete all the shop inventory buttons.
* Convert all of the camp building buttons to a data driven system. It's not bad the way it is now, and will be functionally identical, but the code will be a little leaner and nicer.
* Collect the IDs from all user-created gameobjects within a certain range, filter out non-user spawned objects, then pass this data to a python (or js maybe) tool that pulls the records from the database and stores in an agnostic format. The goal being to allow a camp to be created in one core and then imported into any supported core. Once that is in place, I can safely devote more time into creating awesome camps, knowing they will never be lost, and I will have the option of synchronizing builds across all three systems.
* Make it clearer in the interface which buttons apply to which cores. Converting buttons to a data driven system is a blocker for this, because which buttons support which cores will be defined with the rest of the button data.
* In addition to the character-bootstrapping features that exist in the Actions panel, I would like to add a function to automatically write configuration settings for other addons. When you have a lot of alts, getting all of their settings dialed in just right is quite the nuisance. Ideally this addon for fully setup everything I want on a fresh character on login, without any other action, but from the limited examination I have done of this problem, it has fussy nuisance written all over it. So who knows.


## Known Issues (apart from things marked unimplemented)
1. Make the keymappings appear in the keybinding panel on 3.3.5 and 7.3.5 (will require branching code, the methods are different).
2. Some buttons won't work unless you have addons installed, and even then they still won't without my personal edits to other addons.
* The "Toggle Minimap" button requires the Hide_minimap() addon for 3.3.5.
* TODO: finish this list, see what dependencies and I can avoid




## Xbox Gamepad Mappings
#### Main Page
Left Stick = Movement\
Press Right Stick = ; (semicolon) Toggles mouse look mode\
Y = Toggle UI\
X = Quick attack left\
B = Quick attack right (I usually map this to auto fight)\
A = Jump\
Y (hold) = Toggle large map\
X (hold) = Quick attack 2 left\
B (hold) = Quick attack 2 right\
(there is no A hold because there are situations in game where you hold A)\
Dpad Up = Page Up (Zoom in)\
Dpad Down = Page Down (Zoom out)\
Dpad Left = Sheathe/Unsheathe\
Dpad Left (hold) = Esc\
Dpad Right = Sit/Swim Downward\
Left Trigger (hold) = Activate page 1  (left side actions)\
Right Trigger (hold) = Activate page 2 (right side actions)\
Left Shoulder button (hold) Activate page 3 (menu actions)\
Right Trigger (hold) + Left Trigger (hold) Activate page 4 (not used yet)\
**Left trigger "release" = Left mouse click** Because this fires on a keyup event this left click bind cannot be used to click and drag things, but it is still useful to have a left click option that is on the main layer.\
Right Shoulder button = "Loot Combo" This rewasd combination hits semicolon, the exit out of mouselook mode, right clicks to loot the target of the cursor. waits  50ms to give looting action chance to happen, then hits semicolon again to return the mouselook mode. This button is the sauce that makes the mode convenient to play in.\
Right Shoulder button (hold) = Similar to the Loot Combo above, but with one difference: it uses the left click instead of right click. Let's you click things and change selection target without leaving mouse look mode.

#### Page 1 - Left side actions - While holding Left Trigger
Y = Ctrl+O\
X = Ctrl+P\
B = Ctrl + [\
A = Ctrl + ]\
Y (hold) = Ctrl+Q\
X (hold) = Ctrl+W\
B (hold) = Ctrl + E\
A (hold) = Ctrl+R\
Dpad Up = Shift + O\
Dpad Left = Shift + P\
Dpad Right = Shift + [\
Dpad Down = Shift + ]\
Dpad Up (hold) = Shift + Q\
Dpad Left (hold) = Shift + W\
Dpad Right (hold) = Shift + E\
Dpad Down (hold) = Shift + R\
Select = Shift + 5\
Start = Shift + 7\
Left Stick button = F1 (first overlay button - open Actions panel)\
Left Shoulder button = *not mapped yet, can put something here*\
Right Stick button = F2 (second overlay button - open Content panel)\
Right Shoulder button = Ctrl + Left click (for previewing gear in dressing room)

#### Page 2 - Right side actions - While holding Right Trigger
Left Shoulder button = Home (brings up the reshade menu)
Y = 1, Left click (by putting ground targeting macros in this spot, you can cast them in one click)\
X = 2\
B = 3\
A = 4\
Y (hold) = 9\
X (hold) = 0\
B (hold) = -\
A (hold) = =\
Dpad Up = Shift + 2\
Dpad Left = Shift + 1\
Dpad Right = Shift + 3\
Dpad Down = Shift + 4\
Dpad Up (hold) = Shift + 9\
Dpad Left (hold) = Shift + 0\
Dpad Right (hold) =  Shift + -\
Dpad Down (hold) = Shift + =\
Select = Ctrl + 1 (not sure why)\
Start = Ctrl + 2 (not sure why)\
Left Stick button = F3 (Respawn targeted dead creature)\
Right Stick button = Light rain\

#### Page 3 - While holding Left Shoulder Button
Dpad Up = Slow walk\
Dpad Left = Normal walk\
Dpad Right = Fast walk\
Dpad Down = Jog  (normal speed)\
Dpad Right (Hold) = Dash\
Start = N (Talents)\
B = L (Quest Log)\
B (hold) = Alt+L (hotkey for the Carbonite addon's quest log, provided you have enabled that setting in Carbonite called "Open Quest Log with Alt+L." I use the normal quest log by default instead of Carbonite's in 3.3.5 because the normal quest log sets internal variables that allow the "Quest Complete" and Drop One Quest" buttons to work. But sometimes I still want to open up Carbonite's log so it's mapped here.\
Left Shoulder button = Shift + Alt + Right click (for the EasyDestroy addon, this bind deletes an item from you inventory)\
Right Shoulder button = Left click. Unlike the left click that occurs on Main Page when you keyup the Left Trigger, this left click can be used for drag-and-drops

#### Page 4 to be used in future
Page 4 is mostly unused presently, but does have some targeting functions\
Dpad Up/Down = Cycle through enemy targets\
Dpad Left/Right = Cycle through friendly targets

These are mapped in case needed but I accomplish my targeting generally by baking targeting into macros for each skills. 


## Macros
Here are some useful macros to go with the gamepad playstyle.

For most attacks and spells I use a macro like this:
```
#showtooltip
/cleartarget
/targetenemy
/cast Smite
```
For most encounters you just point yourself at the general direction of your enemy and let the macro handle the targeting. The down side is being enable to pick out targets from a crowd but that's a price I'm willing to pay.

Here's one for healing a friendly ally.
```
#showtooltip
/cleartarget
/tar [@mouseover,help,nodead,mod:alt][@focus,help,nodead,mod:shift]
/targetfriend [noexists]
/cast Lesser Heal
```

Macro for bringing a PlayerBot online and Inviting them to your party:
```
.bot add Botname
/in 2 /invite Botname
/in 4 /script SetLootMethod("freeforall")
```
A couple notes, I use freeforall loot method, and the all of the RPG____ buttons in the Actions Panel set bots to not loot. Letting them loot was just too much futzy micromanaging for me, but if you want to have your bots loot, I suggest using the Passloot addon (3.3.5) as it allows you to automatically need/greed/pass without even seeing the roll window.

Omni pet attack macro. This macro tells your hunter/warlock pet, your PlayerBots party, and your NPCBots party, to attack your target. One button, to destroy them all.
```
/cleartarget
/targetenemy
/petattack
/script SendChatMessage("attack", "PARTY") SendChatMessage(".npcb command order cast auto_attack mytarget", "party")
```

Omni summon/return/follow macro. Like the Omni attack above, this commands all types of pets to return to your side, and puts them in follow mode if they weren't before. For PlayerBots, the summon command revives them all, but for NPCBots you can revive one at a time by targeting the dead bot before using this.
```
/petfollow
/script local c="party";local f=SendChatMessage;f("follow", c) f("summon",c) f(".npcb rec tele", c) f(".npcb revive",c) f(".npcb co follow") f("nc -grind,-travel,-rpg maintenance,-rpg repair", c)
```

"bont"
```
/bot
/bonk
```
For PlayerBots, the "/bot" command brings up a menu from the PlayerBots addon. 
For NPCBots, the "bonk" command makes a bot tell you their detailed stats. Therefore "bont."


