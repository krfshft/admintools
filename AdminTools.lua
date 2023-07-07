

--For sharing functions and data internally
AdminUtils = {}

--For exposing methods externally, not currently used
AdminActions = {}

-- Is set by AutorunAddTalents()
AdminUtils.gameVersion = nil

--player name is used to make home and camp teleports player-specific
AdminUtils.playerName = UnitName("player")

--class is used to filter talents
AdminUtils.playerClass, AdminUtils.playerClassID = UnitClass("player")


function AdminUtils.GetSelectedQuestID()
	local questIndex = GetQuestLogSelection()
	if questIndex then
		local _, _, _, _, _, _, _, _, questID = GetQuestLogTitle(questIndex)
		return questID
	end
	return nil
end

-- Watches for the quest log and saves the ID from the last opened quest, so it can
-- be either completed or abandoned
local function SaveQuestFromLogDetails()
	local questDetailFrame = CreateFrame("Frame")
	questDetailFrame:RegisterEvent("QUEST_DETAIL")
	questDetailFrame:SetScript("OnEvent", function(self, event)
		if event == "QUEST_DETAIL" then
			local questID = AdminUtils.GetSelectedQuestID()
			if questID then
				AdminUtils.latestQuestID = questID
			end
		end
	end)
end

----------------------------------------------------------------start utils lib
--------------------------------------------------------------start button data

AdminUtils.buttons = {
	Action = {
		{ "Grow", "Spell_holy_spellwarding" },
		{ "Shrink", "Inv_misc_toy_04" },
		{ "UberHeal", "Spell_holy_auramastery" },
		{ "Dispell", "Ability_hunter_beastwithin" },
		{ "Morph", "Ability_warlock_demonicpower" },
		{ "Unmorph", "Ability_hunter_beastwithin" },
		{ "Immolate", "Spell_fire_burnout" },
		{ "Douse", "Inv_drink_19" },
		{ "Hat", "Inv_helmet_119" },
		{ "Cloak", "Inv_misc_cape_18" },
		{ "Frostpath", "Spell_deathknight_pathoffrost" },
		{ "FrostPresence", "Spell_deathknight_frostpresence" },
		{ "BloodPresence", "Spell_deathknight_bloodpresence" }, 
		{ "UnholyPresence", "Spell_deathknight_unholypresence" },
		{ "Who", "Ability_eyeoftheowl" },
	},
	Action2 = {
		{ "GearsWrath", "Inv_misc_bag_07_black" },
		{ "GearsLegion", "Inv_misc_bag_07_black" },
		{ "SpellsWrath", "Spell_holy_magicalsentry" },
		{ "SpellsLegion", "Spell_holy_magicalsentry" },
		{ "TalentsWrath", "Inv_jewelry_frostwolftrinket_03" },
		{ "TalentsLegion", "Inv_jewelry_frostwolftrinket_03" },
		{ "HeirloomsWrath", "Item_icecrownringc" },
		{ "HeirloomsLegion", "Item_icecrownringc" },
		{ "HeirloomUpgrades", "Item_icecrownringc" },		
		{ "Keys", "Inv_misc_key_11" },
	},
	Summon = {
		{ "Imp", "Spell_shadow_summonimp" },
		{ "Voidwalker", "Spell_shadow_summonvoidwalker" },
		{ "Succubus", "Spell_shadow_summonsuccubus" },
		{ "Felhunter", "Spell_shadow_summonfelhunter" },
		{ "Felguard", "Spell_shadow_summonfelguard" },
		{ "InfernalWrath", "Spell_shadow_summoninfernal" },
		{ "InfernalLegion", "Spell_shadow_summoninfernal" },
		{ "Doomguard1", "Ability_warlock_demonicempowerment" },
		{ "Doomguard2", "Ability_warlock_demonicempowerment" },
		{ "Ghoul", "Spell_shadow_animatedead" },
		{ "WaterElemental", "Spell_frost_summonwaterelemental_2" },
		{ "FeralSpirit", "Spell_nature_spiritwolf" },
	},
	Pet = {
		{ "TameBeast", "Ability_hunter_beasttaming" },
		{ "SuperTame", "Ability_hunter_beasttaming" },
		{ "Charm", "Spell_shadow_charm" },
		{ "Possess", "Spell_shadow_possession" },
		{ "MendPet", "Ability_hunter_mendpet" },
		{ "RevivePet", "Ability_hunter_beastsoothe" },
		{ "CallPet", "Ability_hunter_beastcall" },
		{ "DismissPet", "Spell_nature_spiritwolf" },
	},
	Weather = {
		{ "Rain", "Spell_frost_summonwaterelemental" },
		{ "LightRain", "Spell_frost_summonwaterelemental" },
		{ "Sand", "Achievement_zone_dustwallowmarsh" },
		{ "LightSand", "Achievement_zone_dustwallowmarsh" },
		{ "Snow", "Achievement_zone_stormpeaks_01" },
		{ "LightSnow", "Achievement_zone_stormpeaks_01" },
		{ "ClearSky", "Achievement_zone_arathihighlands_01" },
	},
	Crafting = {
		{ "First Aid", "Inv_misc_bandage_01" }, 
		{ "Cooking", "Inv_misc_food_95_grainbread" },
		{ "Basic Campfire", "Spell_fire_fire" },
		{ "Alchemy", "Trade_alchemy" },
		{ "Enchanting", "Trade_engraving", },
		{ "Jewelcrafting", "Inv_box_02" },
		{ "Inscription", "Inv_inscription_tradeskill01" },
		{ "Tailoring", "Trade_tailoring" }, 
		{ "Leatherworking", "Trade_leatherworking" },
		{ "Blacksmithing", "Trade_blacksmithing" },
		{ "Engineering", "Inv_misc_wrench_01" },
		{ "Runeforging", "Inv_weapon_shortblade_92" },
		{ "Smelting", "Spell_fire_flameblades" },
		{ "Milling", "Ability_miling" }, 
		{ "Prospecting", "Inv_jewelcrafting_gem_38" },
	},
	PlayerBot = {
		{ "RPGOn", "Inv_shirt_purple_01" },
		{ "RPGLite", "Inv_shirt_grey_01" },
		{ "RPGOff", "Inv_shirt_black_01" },
		{ "RTSC", "Inv_gizmo_02" },

		{ "TalkRepairSell", "Achievement_reputation_01" },
		{ "Talk", "Achievement_character_human_female" },
		{ "Repair", "Inv_hammer_20" },
		{ "Sell", "Inv_misc_coin_02" },

		{ "Summon", "Ability_hunter_beastcall" },
		{ "Guard", "Ability_rogue_feigndeath" },
		{ "Stay", "Spell_nature_timestop" },
		{ "Free", "Spell_nature_massteleport" },
	},	
	NPCBot = {
		{ "npcbMerchant", "Inv_misc_grouplooking" },
		{ "npcbAdd", "Inv_gizmo_02" },
		{ "npcbRemove", "Inv_gizmo_02" },
		{ "npcbUnbind", "Inv_gizmo_02" },
		{ "npcbDelete", "Inv_sigil_mimiron" },
		{ "npcbWalk", "Spell_fire_burningspeed" },
		{ "npcbHide", "Ability_stealth" },
		{ "npcbUnhide", "Ability_stealth" },
		{ "npcbReturn", "Ability_hunter_beastcall" },
		{ "npcbStopFully", "Spell_nature_timestop" },
		{ "npcbStandstill", "Spell_nature_timestop" },
		
	},
	Tele = {
		{ "Stormwind", "Achievement_zone_elwynnforest" },
		{ "Ironforge", "Achievement_zone_dunmorogh" },
		{ "Darnassus", "Achievement_zone_darnassus" },
		{ "Orgrimmar", "Achievement_zone_durotar" },
		{ "Undercity", "Achievement_zone_tirisfalglades_01" },
		{ "Thunder Bluff", "Spell_arcane_teleportthunderbluff" },
		{ "Silvermoon", "Achievement_zone_eversongwoods" },
		{ "Shattrath", "Achievement_zone_terrokar" },
		{ "Dalaran", "Achievement_zone_crystalsong_01" },
		{ "GMIsland", "Achievement_zone_easternkingdoms_01" },
	},
	TeleHome = {
		{ "Home1", "Achievement_zone_sholazar_04" },
		{ "Home2", "Achievement_zone_sholazar_02" },
		{ "Home3", "Achievement_zone_sholazar_06" },
		{ "Home4", "Achievement_zone_sholazar_09" },
		{ "Home5", "Achievement_zone_grizzlyhills_06" },
		{ "Home6", "Achievement_zone_zuldrak_04" },
		{ "Home7", "Achievement_zone_grizzlyhills_10" },
		{ "Home8", "Achievement_zone_grizzlyhills_10" },
	},
	TeleCamp = {
		{ "Camp1", "Achievement_zone_hillsbradfoothills" },
		{ "Camp2", "Achievement_zone_howlingfjord_11" },
		{ "Camp3", "Achievement_zone_howlingfjord_10" },
		{ "Camp4", "Achievement_zone_howlingfjord_03" },
		{ "Camp5", "Achievement_zone_grizzlyhills_04" },
		{ "Camp6", "Achievement_zone_sholazar_05" },
		{ "Camp7", "Achievement_zone_dragonblight_03" },
		{ "Camp8", "Achievement_zone_dragonblight_03" },	
	},
	TeleShared = {
		{ "Shared1", "Achievement_zone_hillsbradfoothills" },
		{ "Shared2", "Achievement_zone_howlingfjord_11" },
		{ "Shared3", "Achievement_zone_howlingfjord_10" },
		{ "Shared4", "Achievement_zone_howlingfjord_03" },
		{ "Shared5", "Achievement_zone_grizzlyhills_04" },
		{ "Shared6", "Achievement_zone_sholazar_05" },
		{ "Shared7", "Achievement_zone_dragonblight_03" },	
		{ "Shared8", "Achievement_zone_dragonblight_03" },	
	
	},
	TeleHomeSet = {
		{ "Home1Set", "Achievement_zone_sholazar_04" },
		{ "Home2Set", "Achievement_zone_sholazar_02" },
		{ "Home3Set", "Achievement_zone_sholazar_06" },
		{ "Home4Set", "Achievement_zone_sholazar_09" },
		{ "Home5Set", "Achievement_zone_grizzlyhills_06" },
		{ "Home6Set", "Achievement_zone_zuldrak_04" },
		{ "Home7Set", "Achievement_zone_grizzlyhills_10" },	
		{ "Home8Set", "Achievement_zone_grizzlyhills_10" },	
	},
	TeleCampSet = {
		{ "Camp1Set", "Achievement_zone_hillsbradfoothills" },
		{ "Camp2Set", "Achievement_zone_howlingfjord_11" },
		{ "Camp3Set", "Achievement_zone_howlingfjord_10" },
		{ "Camp4Set", "Achievement_zone_howlingfjord_03" },
		{ "Camp5Set", "Achievement_zone_grizzlyhills_04" },
		{ "Camp6Set", "Achievement_zone_sholazar_05" },
		{ "Camp7Set", "Achievement_zone_dragonblight_03" },	
		{ "Camp8Set", "Achievement_zone_dragonblight_03" },	
	},
	TeleSharedSet = {
		{ "Shared1Set", "Achievement_zone_hillsbradfoothills" },
		{ "Shared2Set", "Achievement_zone_howlingfjord_11" },
		{ "Shared3Set", "Achievement_zone_howlingfjord_10" },
		{ "Shared4Set", "Achievement_zone_howlingfjord_03" },
		{ "Shared5Set", "Achievement_zone_grizzlyhills_04" },
		{ "Shared6Set", "Achievement_zone_sholazar_05" },
		{ "Shared7Set", "Achievement_zone_dragonblight_03" },	
		{ "Shared8Set", "Achievement_zone_dragonblight_03" },	
	},
	TeleOther = {
		{ "Waypoint", "Spell_arcane_portalstormwind" },
		{ "Return", "Spell_arcane_portalexodar" },
		{ "WaypointSet", "Inv_trinket_naxxramas06" },	
	},
	NPC = {
		{ "Banker", "Inv_misc_grouplooking" },
		{ "ReagentsAcore", "Inv_misc_grouplooking" },
		{ "AllyGuildBank", "Inv_misc_grouplooking" },
		{ "HordeGuildBank", "Inv_misc_grouplooking" },
		{ "VendTrade", "Inv_misc_grouplooking" },
		{ "VendTrade2", "Inv_misc_grouplooking" },
		{ "VendMisc", "Inv_misc_grouplooking" },
		--TODO: find more vendors who aren't accessible to spots, or
		--select some and delete their original from the gameworld
		{ "VendRepairAlly", "Inv_hammer_20" },
		--{ "VendRepairHorde", "Inv_hammer_20" },
		{ "WeaponVisual", "Inv_misc_grouplooking" },
		{ "TransmogWrath", "Inv_misc_grouplooking" },
		{ "TransmogLegion", "Inv_misc_grouplooking" },
		
		{ "StormwindCityGuard", "Ability_warrior_stalwartprotector" },
		{ "DarnassusGuard", "Ability_warrior_stalwartprotector" },
		--Ironforge, Shattrath, Dalaran?
		{ "OrgrimmarGrunt", "Ability_warrior_stalwartprotector" },
		{ "UndercityGuard", "Ability_warrior_stalwartprotector" },
		--Thunder Bluff, dunno other horde cities
		--Gadgetzan?

		{ "LichKing", "Achievement_boss_lichking" },
		{ "KelThuzad", "Achievement_boss_kelthuzad_01" },
		{ "Illidan", "Achievement_boss_illidan" },
		{ "Kaelthas", "Inv_misc_grouplooking" },
		
		{ "VarianWrynn", "Achievement_leader_king_varian_wrynn" },
		{ "MagniBronzebeard", "Achievement_leader_king_magni_bronzebeard" },
		{ "TyrandeWhisperwind", "Achievement_leader_tyrande_whisperwind" },
		{ "Velen", "Achievement_leader_prophet_velen" },

		{ "Thrall", "Inv_misc_grouplooking" },
		{ "Sylvanas", "Achievement_leader_sylvanas" },
		{ "CairnBloodhoof", "Inv_misc_grouplooking" },
	},
	ShopInv = {
		{ "InvMinerals", "Inv_misc_bag_enchantedrunecloth" },
		{ "InvArcana", "Spell_arcane_studentofmagic" },
		{ "InvTextiles", "Inv_fabric_soulcloth_bolt" },
		{ "InvMachineParts", "Inv_misc_enggizmos_30" },
		{ "InvTierGear", "Spell_deathknight_bladedarmor" },
		{ "InvMountsCheap", "Ability_mount_nightmarehorse" },
		{ "InvMountsEX", "Achievement_boss_fourhorsemen" },
		{ "InvScrolls", "Inv_scroll_05" },
		{ "InvMisc", "Inv_sword_2h_ashbringercorrupt" },
	},
	Minerals = {
		{ "Copper", "Inv_ore_copper_01" },
		{ "Tin", "Inv_ore_tin_01" },
		{ "Silver", "Inv_ingot_01" },
		{ "Iron", "Inv_ore_iron_01" },
		{ "Gold", "Inv_ore_gold_01" },
		{ "Mithril", "Inv_ore_mithril_02" },
		{ "Truesilver", "Inv_ore_truesilver_01" },
		{ "DarkIron", "Inv_ore_mithril_01" },
		{ "Thorium", "Inv_ore_thorium_02" },
		{ "FelIron", "Inv_ore_feliron" },
		{ "Nethercite", "Inv_ore_ethernium_01" },
		{ "Adamantite", "Inv_ore_adamantium" },
		{ "Khorium", "Inv_ore_khorium" },
		{ "Cobalt", "Inv_ore_cobalt" },
		{ "Saronite", "inv_ore_saronite_01" },
		{ "Titanium", "inv_ore_platinum_01" },
	
	},
	Herbs = {
		{ "Silverleaf", "Inv_misc_herb_10" },
		{ "Peacebloom", "inv_misc_flower_02" }, 
		{ "Earthroot", "inv_misc_herb_07" }, 
		{ "Mageroyal", "inv_jewelry_talisman_03" }, 
		{ "Briarthorn", "inv_misc_root_01" },
		{ "Stranglekelp", "inv_misc_herb_11" },
		{ "WildSteelbloom", "inv_misc_flower_01" }, 
		{ "Gravemoss", "inv_misc_dust_02" }, 
		{ "Kingsblood", "inv_misc_herb_03" }, 
		{ "Liferoot", "inv_misc_root_02" },
		{ "Fadeleaf", "inv_misc_herb_12" },
		{ "Goldthorn", "inv_misc_herb_15" },
		{ "KhadgarsWisker", "inv_misc_herb_08" },
		{ "Wintersbite", "inv_misc_flower_03" },
		{ "Firebloom", "inv_misc_herb_19" },
		{ "PurpleLotus", "inv_misc_herb_17" },
		{ "ArthasTears", "inv_misc_herb_13" },
		{ "Sungrass", "inv_misc_herb_18" },
		{ "Blindweed", "inv_misc_herb_14" }, 
		{ "GhostMushroom", "inv_mushroom_08" }, 
		{ "Gromsblood", "inv_misc_herb_16" },
		{ "GoldenSansam", "inv_misc_herb_sansamroot" },
		{ "Dreamfoil", "inv_misc_herb_dreamfoil" },
		{ "MountainSilversage", "inv_misc_herb_mountainsilversage" },
		{ "Plaguebloom", "inv_misc_herb_plaguebloom" },
		{ "Icecap", "inv_misc_herb_icecap" },
		{ "BlackLotus", "inv_misc_herb_blacklotus" },
		{ "Felweed", "inv_misc_herb_felweed" }, 
		{ "DreamingGlory", "inv_misc_herb_dreamingglory" },
		{ "Terocone", "inv_misc_herb_terrocone" },
		{ "Ragveil", "inv_misc_herb_ragveil" },
		{ "AncientLichen", "inv_misc_herb_ancientlichen" },
		{ "Goldclover", "inv_misc_herb_goldclover" },
		{ "NightmareVine", "inv_misc_herb_nightmarevine" },
		{ "Netherbloom", "inv_misc_herb_netherbloom" },
		{ "ManaThistle", "inv_misc_herb_manathistle" },
		{ "Firethorn", "inv_misc_herb_11a" },
		{ "TigerLily", "inv_misc_herb_tigerlily" },
		{ "ManaThistle", "inv_misc_herb_manathistle" },
		{ "TalandrasRose", "inv_misc_herb_talandrasrose" },
		{ "AddersTongue", "inv_misc_herb_evergreenmoss" },
		{ "LichBloom", "inv_misc_herb_whispervine" },
		{ "Icethorn", "inv_misc_herb_icethorn" },
		{ "FrostLotus", "inv_misc_herb_frostlotus" },
	},
	Camp1 = {
		{ "Anvil", "Trade_blacksmithing" },
		{ "ForgeHuman", "Trade_blacksmithing" },
		{ "ForgeDraenei", "Trade_blacksmithing" },
		{ "ForgeOgre", "Trade_blacksmithing" },
		{ "BlackAnvil", "Trade_blacksmithing" },
		{ "BlackForge", "Trade_blacksmithing" },
		{ "WaterBarrel", "Inv_drink_waterskin_12" },
		{ "FoodCrate", "Inv_crate_01" },
		{ "AlchemyLab", "Trade_alchemy" },
		{ "CookingTableHorde", "Inv_misc_food_115_condorsoup" },
		{ "Runeforge", "Spell_deathknight_frozenruneweapon" },
		{ "AlchemyTable", "Trade_alchemy" },
		{ "AlchemyRack", "Trade_alchemy" },
		{ "Potion", "Trade_alchemy" },
		{ "ApothecaryTent", "Trade_alchemy" },
		{ "ApothecaryBloodSet", "Trade_alchemy" },
		{ "ApothecaryBench", "Trade_alchemy" },
		{ "ApothecaryBottle", "Trade_alchemy" },
		{ "ApothecaryBookshelf", "Trade_alchemy" },
		{ "EmptyShelf", "Inv_misc_bag_12" },
		{ "Rug2", "Ability_mount_flyingcarpet" },
		{ "Chair", "Inv_misc_bag_12" },
		{ "DalaranChair", "Inv_misc_bag_12" },
		{ "ElfChair", "Inv_misc_bag_12" },
		{ "FishingChair", "Inv_misc_bag_12" },
		{ "StoneChair", "Inv_misc_bag_12" },
		{ "StoneChairBroken", "Inv_misc_bag_12" },
		{ "StoneThrone", "Inv_misc_bag_12" },
		{ "WarsongThrone", "Inv_misc_bag_12" },
		{ "GreyChair", "Inv_misc_bag_12" },
		{ "GreyBench", "Inv_misc_bag_12" },
		{ "RoughTable", "Inv_misc_bag_12" },
		{ "WoodBench", "Inv_misc_bag_12" },
		{ "StoneBench", "Inv_misc_bag_12" },
		{ "InnBarrel", "Inv_misc_bag_12" },
		{ "Armoire", "Inv_misc_enggizmos_17" },
		{ "Footlocker", "Inv_misc_enggizmos_17" },
	},
	Camp2 = {
		{ "SittingLog", "Inv_misc_bag_12" },
		{ "Campfire", "Spell_fire_fire" },
		{ "Bonfire", "Inv_summerfest_firespirit" },
		{ "WeaponRack", "Inv_sword_04" },
		{ "Bunkbed", "Inv_misc_bag_12" },
		{ "CanopyBed", "Inv_misc_bag_12" },
		{ "StandingTorch", "Inv_torch_lit" },
		{ "ShadowTorch", "Inv_torch_lit" },
		{ "Lantern", "Inv_misc_lantern_01" },
		{ "SkullCandle", "Inv_misc_bone_orcskull_01" },
		{ "BlackCandle", "Inv_misc_candle_01" },
		{ "Candle1", "Inv_misc_candle_01" },
		{ "Candle2", "Inv_misc_candle_01" },
		{ "Candle3", "Inv_misc_candle_01" },
		{ "Jar1", "Inv_misc_bag_12" },
		{ "Jar2", "Inv_misc_bag_12" },
		{ "Jar3", "Inv_misc_bag_12" },
		{ "JarOrc", "Inv_misc_bag_12" },
		{ "CampMug", "Inv_drink_03" },
		{ "CampJug", "Inv_misc_bag_12" },
		{ "Jug1", "Inv_misc_bag_12" },
		{ "Outhouse", "Inv_misc_bag_12" },
		{ "BookPile", "Inv_misc_book_08" },
		{ "BookPile2", "Inv_misc_book_08" },
		{ "BookOpen", "Inv_misc_book_08" },
		{ "SecretDoorBooks", "Inv_misc_book_08" },
		{ "Bookshelf", "Inv_misc_book_08" },
		{ "BookshelfEmpty", "Inv_misc_bag_12" },
		{ "PotbellyStove", "Spell_fire_flameshock" },
		{ "Spotlight", "Inv_misc_bag_12" },
		{ "SpotlightCeiling", "Inv_misc_bag_12" },
		{ "GoblinPlatform", "Inv_misc_bag_12" },
		{ "MetalPlatform", "Inv_misc_bag_12" },
		{ "StormwindWagon", "Inv_misc_bag_12" },
		{ "KegWagon", "Inv_cask_04" },
		{ "HordeKegWagon", "Inv_cask_04" },
		{ "WagonUnloaded", "Inv_misc_bag_12" },
	},
	Camp3 = {
		{ "FancyTable", "Inv_misc_bag_12" },
		{ "MetalTable", "Inv_misc_bag_12" },
		{ "EnergyCube", "Inv_misc_bag_12" },
		{ "SunwellPlateau", "Inv_misc_bag_12" },
		{ "GreenSoulsFloor", "Inv_misc_bag_12" },
		{ "BigSpookyBottle", "Inv_misc_bag_12" },
		{ "SenjinBatTotem", "Inv_misc_bag_12" },
		{ "GlassPlatform", "Inv_misc_bag_12" },	
		{ "MedicalCrateAlly", "Inv_misc_bag_12" },	
		{ "MedicalCrateHorde", "Inv_misc_bag_12" },	
		{ "Bandages", "Inv_misc_bag_12" },
		{ "ChemicalWagon", "Inv_misc_bag_12" },
		{ "ForsakenWagon", "Inv_misc_bag_12" },
		{ "Fire", "Inv_summerfest_firespirit", "Only fire lives here now" },
	},
	Buildings = {
		{ "AirshipAlliance", "Inv_misc_bag_12" },
		{ "AirshipHorde", "Inv_misc_bag_12" },
		{ "WhiteTent1", "Inv_misc_bag_12" },
		{ "WhiteTent2", "Inv_misc_bag_12" },
		{ "LargeTent", "Inv_misc_bag_12" },
		{ "ColorfulTent", "Inv_misc_bag_12" },
		{ "NightElfTent", "Inv_misc_bag_12" },
		{ "DarkmoonFortuneTent", "Inv_misc_bag_12" },
		{ "DarkmoonFoodTent", "Inv_misc_bag_12" },
		{ "DarkmoonSouvenirTent", "Inv_misc_bag_12" },
		{ "DarkmoonTicketTent", "Inv_misc_bag_12" },
		{ "Necropolis", "Inv_misc_bag_12" },
		{ "HordeTent", "Inv_misc_bag_12" },
		{ "SenjinTent", "Inv_misc_bag_12" },
		{ "ShadowsightTower", "Inv_misc_bag_12" },
		{ "SnowyTower", "Achievement_zone_icecrown_06" },
		{ "NewAvalonMill", "Inv_misc_bag_12" },
		{ "GardenHouse", "Achievement_zone_ironforge" },
		{ "Inn", "Achievement_zone_ironforge" },
		{ "Barracks", "Achievement_zone_ironforge" },
		{ "Armory", "Achievement_zone_ironforge" },
		{ "Barn", "Achievement_zone_ironforge" },
		{ "Stable", "Achievement_zone_ironforge" },
		{ "Engineering", "Achievement_zone_ironforge" },
		{ "Mill", "Achievement_zone_ironforge" },
		{ "TradingPost", "Achievement_zone_ironforge" },
		{ "SparringArena", "Achievement_zone_ironforge" },
	},
	Addons = {
		{ "Baggins", "Inv_misc_bag_07_black" },
	},
	Management = {
		{ "LevelUp10", "Inv_potion_112", },
		{ "LevelUp1", "Inv_potion_106", },
		{ "LevelDown1", "inv_potion_85", },
		{ "LevelDown10", "Inv_potion_65", },
		{ "AddTalentPoint", "Achievement_bg_tophealer_wsg", },
		{ "KillCreature", "Inv_staff_78", },
		{ "RespawnCreature", "Spell_shaman_blessingofeternals", },
		{ "DeleteCreature", "Inv_sigil_mimiron", },
		{ "NearObjects", "Trade_engineering", "List gobjects within 20 yards" },
		{ "DeleteNearestObj", "Inv_sigil_mimiron", 
			"Delete the nearest (within 2 yards) gobject (warning: no confirmation)" },
		{ "DeleteLastObj",	"Inv_sigil_mimiron", 
			"Delete the most recently added gobject (warning: no confirmation)" },
		{ "HDCVars", "Inv_gizmo_01", "Sets game engine settings for high view distance and foliage density" },
		{ "HDLiteCVars", "Inv_gizmo_01", "Sets game engine settings for high view distance and foliage density" },
		{ "HDCVarsLegion", "Inv_gizmo_01", "Sets game engine settings for high graphics quality on the legion client" },
		{ "DropOne", "Spell_shadow_unsummonbuilding", "Abandon current quest (warning: no confirmation)" },
		{ "DropAll", "Spell_shadow_unsummonbuilding", "Abandon all quests (warning: no confirmation)" },
		{ "HideChat", "Inv_letter_11", "Toggle display of the default chat frame" },
		{ "MinimapToggle", "Inv_misc_map03", "Toggle display of the default chat frame" },
		{ "QuestComplete", "Inv_misc_trophy_argent" },
	},
}

--Don't try to edit this without code folding
AdminUtils.buttonFunctions = {
	Action = {
		Fly = function()
			AdminUtils.cmd(".gm fly on")
			AdminUtils.cmd(".gm on")
			--Toggling GM mode cures resurrection sickness
			AdminUtils.cmd(".unaura 15007")
		end,
		Land = function()
			AdminUtils.cmd(".gm fly off")
			AdminUtils.cmd(".gm off")
		end,
		-- Cancel spells and gmauras that cannot be easily cancelled in the ui
		-- This includes anything I have set to be infinite duration
		Dispell = function()
			local spells = {
				-- power word fortitude
				1243, 1244, 1245, 2791, 10937, 10938, 14767, 48161, 23948, 13864, 23589, 36004, 
				48161, 58921,
				-- Uber heal
				1908,
				-- Grow, Shrink
				18209, 19210,

			}
			for idx = 1, #spells do
				AdminUtils.cmd(".unaura " .. spells[idx])
			end
		end,
		Morph = function()
			AdminUtils.cmd(".cast 47241")
		end,
		Unmorph = function()
			AdminUtils.cmd(".unaura 47241")
		end,
		Immolate = function()
			AdminUtils.cmd(".cast 50589")
		end,
		Douse = function() 
			AdminUtils.cmd(".unaura 50589")
		end,
		Who = function()
			SendWho("1-80 " .. GetRealZoneText())
		end,		
		SlowWalk = function()
			AdminUtils.cmd(".modify speed 0.22")

			--these commands only work on cmangos
			AdminUtils.cmd(".modify swim 0.22")
			AdminUtils.cmd(".modify fly 0.22")
		end,
		Walk = function()
			AdminUtils.cmd(".modify speed 0.34")		
			AdminUtils.cmd(".modify swim 0.34")
			AdminUtils.cmd(".modify fly 0.34")
		end,
		FastWalk = function()
			AdminUtils.cmd(".modify speed 0.52")
			AdminUtils.cmd(".modify swim 0.52")
			AdminUtils.cmd(".modify fly 0.52")
		
		end,
		Jog = function()
			AdminUtils.cmd(".modify speed 1")		
			AdminUtils.cmd(".modify swim 1")
			AdminUtils.cmd(".modify fly 1")
		end,
		Dash = function()
			AdminUtils.cmd(".modify speed 3.5")		
			AdminUtils.cmd(".modify swim 3.5")
			AdminUtils.cmd(".modify fly 3.5")
		end,
		Stealth = function()
			AdminUtils.cmd(".cast 10032")
		end,
		UberHeal = function()
			AdminUtils.cmd(".cast 1908")
		end,
		Grow = function()
			AdminUtils.cmd(".cast 18209")
		end,
		Shrink = function()
			AdminUtils.cmd(".cast 18210")
		end,
		FrostPresence = function()
			AdminUtils.cmd(".cast 48263")
		end,
		BloodPresence = function()
			AdminUtils.cmd(".cast 48266")
		end,
		UnholyPresence = function()
			AdminUtils.cmd(".cast 48265")
		end,
		ResetSize = function()
			AdminUtils.cmd(".unaura 18209")
			AdminUtils.cmd(".unaura 18210")
		end,
		Frostpath = function()
			AdminUtils.cmd(".cast 3714")	
		end,
		GearsWrath = function()
			local gears = {
				--Band of Reanimation, Ring of Entropy, Eye of the Dead
				22961, 18543, 23047,
				--portable hole
				51809, 51809, 51809, 51809, 
				--cargo pants
				5016,
			}
			for idx = 1, #gears do
				AdminUtils.cmd(".additem " .. gears[idx])
				AdminUtils.cmd(".add item " .. gears[idx])
			end
		end,
		GearsLegion = function()
			local gears = {
				--Starter Gear------------------------------
				--minion dmg ring (band of reanimation), ring of entropy (early levelling)
				22961, 18543,
				--horseman's signet ring (minion dmg +higher lv stats)
				34073, 
				--ring of faith
				23061, 
				--witches band, ring of ghoulish delight
				34074, 34075,
				--36 slot bag (must be modded on server)
				51809, 51809, 51809, 51809,
				--brawler's harness (boe shirt for transmogging)
				6125,
			}
			for idx = 1, #gears do
				AdminUtils.cmd(".additem " .. gears[idx])
			end
		end,
		HeirloomsWrath = function()
			local items = {
				--weapons
				--Venerable Dal'Rend's Sacred Charge, Battleworn Thrash Blade
				42945, 44096, 
				--Grand Staff of Jordan, Dignified Headmaster's Charge
				44095, 42947, 
				--Devout Aurastone Hammer, Blessed Hammer of Grace
				42948, 44094, 
				--Venerable Mass of McGowen, Charmed Ancient Bone Bow
				48716, 42946, 
				--Bloodied Arcanite Reaper, Balanced Heartseeker
				42943, 42944, 
				--Sharpened Scarlet Kris, Repurposed Lava Dredger
				44091, 48718, 
				--Reforged Truesilver Champion, Upgraded Dwarven Hand Cannon
				44092, 44093, 
				
				--armor
				--Polished Valor shoulder/chest, Champion Herod sho/chest
				42949, 48685, 42950, 48677, 
				--Tattered Dreadmist sh/ch, Mystical sh/ch
				42985, 48691, 42951, 48683, 
				--Stained Shadowcraft sh/ch, Preened Ironfeather sh/ch
				42952, 48689, 42984, 48687, 
				
				--Prised Beastmaster's Mantle, Exceptional Stormshroud Shoulders
				44101, 44103, 
				--Lasting Feralheart Spaulders, Strengthened Stockade Pauldrons
				44105, 44099, 
				--Exquisite Sunderseer Mantle, Aged Pauldrons of the Five Thunders
				44107, 44102,
				--Pristine Lightforge Spaulders
				44100,
				
				--jewelry, trinkets
				--Dread Pirate Ring, Discerning Eye of the Beast
				50255, 42992,
				--Swift Hand of Justice, Inherited Insignia of the Alliance/Horde
				42991, 44098, 44097,
				
				--enchants
				--Chest - Greater Stats, plan, Bracers - Greater Stats
				38865, 16253, 38987,
				--Weapon - Crusader, Weapon - Super Striking, 2H Weapon - Super Impact
				38878, 38870, 38869, 
				
			}
			for idx = 1, #items do
				AdminUtils.cmd(".additem " .. items[idx])
			end
		end,
		HeirloomsLegion = function()
			local items = {
				--hats
				122263, 122245, 127012, 122247, 122249, 122248, 122246, 122250,
				--shoulders
				122388, 122355, 122373, 122372, 122375, 122356, 122376, 122377, 122357,
				122359, 122374, 122358, 122378, 122360, 
				--cloaks
				122262, 122261, 122266, 122260, 
				--chest
				122387, 122381, 127010, 122379, 122380, 122382, 122383, 122384, 
				--legs
				122264, 122251, 127011, 122253, 122255, 122254, 122252, 122256,
				--weapons
				122349, 122352, 104399, 122366, 122354, 122367, 122385, 122386, 140773, 
				131733, 122389, 122351, 122369, 122365, 122363, 122353, 122368, 122396, 
				122350, 122364, 122391, 122392, 122390, 
				--jewelry, trinkets
				128173, 128172, 126948, 122362, 122529, 122663, 122667, 122664, 122662, 
				122668, 122666, 153130, 126949, 128169, 122361, 128318, 122371, 122370, 
				122530
			}
			for idx = 1, #items do
				AdminUtils.cmd(".additem " .. items[idx])
			end
		end,
		HeirloomUpgrades = function()
			local items = {
				--ancient heirloom armor casing, scabbard, timeworn armor, scabbard
				"122338 6", "122339 6", "122340 6", "122341 6",
				--weathered heirloom armor casing, scabbard
				"151614 6", "151615 6"
			}
			for idx = 1, #items do
				AdminUtils.cmd(".additem " .. items[idx])
			end
		end,
		SpellsWrath = function()
			local function learnSpells(spells)
				local playerLevel = UnitLevel("player")

				for idx = 1, #spells do
					local spell = spells[idx]
					if type(spell) == "table" then
						for i = 1, #spell, 2 do
							local requiredLevel = spell[i]
							local spellID = spell[i + 1]

							if playerLevel >= requiredLevel then
								AdminUtils.cmd(".learn " .. spellID)
							end
						end
					else
						AdminUtils.cmd(".learn " .. spell)
					end
				end
			end

			local spells = {
				--Death Knight------------------------------
				--Blood Presence, Frost Presence, Unholy Presence, Raise Dead
				48266, 48263, 48265, 46585,
				--Death Grip
				49576, 
				
				--Warrior-----------------------------------
				
				--Paladin-----------------------------------

				--Hunter------------------------------------
				--tame beast, revive pet, mend pet 1, call pet, dismiss pet
				1515, 982, 136, 883, 2641,
				
				--Mage--------------------------------------
				--Fireball
				{ 1, 133, 8, 143, 14, 145, 22, 3140, 30, 8400, 38, 8401, 46, 8402, 54, 10148, 62, 10149, 70, 10150, 75, 27070, 80, 38692 },
				--Fire Blast
				{ 6, 2136, 14, 2137, 22, 2138, 30, 2941, 38, 8444, 46, 8445, 54, 10197, 62, 10199, 70, 27078, 75, 27079, 80, 42872 },
				--Frostbolt
				{ 4, 116, 8, 205, 14, 837, 20, 7322, 26, 8406, 32, 8407, 38, 8408, 44, 10179, 50, 10180, 56, 10181, 60, 27071, 65, 27072, 70, 27073, 75, 42841, 80, 42842 },
				--Arcane Missiles
				{ 8, 5143, 16, 5144, 24, 5145, 32, 8416, 40, 8417, 48, 10211, 56, 10212, 63, 27074, 69, 27075, 72, 42843, 77, 42844 },
				--Frost Armor
				{ 1, 168, 10, 7300, 20, 7301 },
				--Blink
				{ 20, 1953 },
				
				--Warlock-----------------------------------
				--imp, voidwalker, succubus, felhunter, felguard, infernal, doomguard
				688, 697, 712, 691, 30146, 1122, 22865,
				--Shadow Bolt
				{ 1, 686, 6, 695, 12, 705, 20, 1088, 28, 1106, 36, 7641, 44, 11659, 
				52, 11660, 60, 11661, 69, 27209, 74, 47808, 79, 47809 },
				--Chaos Bolt
				{ 60, 50796, 70, 59170, 75, 59171, 80, 59172 },
				--Drain Soul
				{ 10, 1120, 24, 8288, 34, 8289, 44, 11675, 53, 11676, 61, 11677, 69, 27217, 76, 47855, 80, 47856 },

				--Rogue-------------------------------------

				--Shaman------------------------------------
				-- Lightning Bolt
				{ 1, 403, 8, 529, 14, 548, 20, 915, 32, 6041, 38, 10391, 44, 10392, 
				50, 15207, 56, 15208, 62, 25448, 67, 25449, 73, 49237, 79, 49238 },
				-- Earth Shock
				{ 4, 8042, 8, 8044, 16, 8045, 24, 8046, 32, 10412, 40, 10413, 48, 10414,
				56, 10447, 64, 25454, 70, 49230, 75, 49231 },
				-- Flame Shock
				--{ 6, 8050, 12, 8052, 20, 8053, 28, 10447, 36, 10448, 44, 29228,
				--52, 25457, 60, 25464, 68, 49232, 77, 49233 },
				-- Stoneclaw Totem
				--{ 8, 5730, 16, 6390, 26, 6391, 36, 6392, 46, 10427, 56, 10428,
				--66, 25525 },
				-- Healing Wave
				--{ 1, 331, 6, 332, 12, 547, 18, 913, 24, 939, 32, 959, 40, 8004,
				--48, 8005, 54, 10395, 60, 10396, 68, 25357, 74, 49272, 80, 49273 },
				-- Earthbind Totem
				--{ 6, 2484 },
				-- Frost Shock
				--{ 10, 8056, 20, 8058, 32, 10472, 42, 10473, 52, 25464, 61, 49235,
				--70, 49236 },
				-- Lesser Healing Wave
				{ 20, 8004, 28, 8008, 36, 8010, 44, 10466, 52, 10467, 60, 10468,
				69, 25420, 75, 49275, 80, 49276 },
				-- Ancestral Spirit
				--{ 12, 2008, 24, 20609, 40, 20610, 58, 20776, 70, 49277 },
				-- Chain Lightning
				--{ 32, 421, 40, 930, 48, 1128, 56, 2860, 63, 25439, 70, 25442,
				--75, 49270, 80, 49271 },
				-- Purge
				--{ 12, 370 },
				-- Wind Shear
				--{ 16, 57994 },
				-- Reincarnation
				{ 30, 20608 },
				-- Water Walking
				--{ 28, 546 },
				-- Chain Heal
				--{ 40, 1064, 46, 10622, 54, 10623, 61, 25396, 70, 25397, 74, 49275, 80, 49276 },
				-- Tremor Totem
				--{ 18, 8143 },
				-- Healing Stream Totem
				--{ 20, 5394, 28, 6375, 38, 6377, 48, 10462, 58, 10463, 68, 25567 },
				-- Mana Spring Totem
				--{ 24, 5675, 34, 10495, 44, 10496, 54, 10497, 65, 25570 },
				-- Grounding Totem
				--{ 30, 8177 },
				-- Searing Totem
				--{ 10, 3599, 20, 6363, 30, 6364, 40, 6365, 50, 10437, 60, 10438, 69, 25533 },
				-- Magma Totem
				{ 26, 8190, 36, 10585, 46, 10586, 56, 10587, 66, 25552 },
				-- Windfury Totem
				--{ 30, 8512, 42, 10613, 54, 10614, 67, 25585 },
				-- Fire Nova Totem
				--{ 12, 1535, 22, 8498, 32, 8499, 42, 8500, 52, 10447, 62, 10448 },
				-- Fire Resistance Totem
				--{ 28, 8184, 38, 10537, 48, 10538, 58, 25563 },
				-- Flametongue Totem
				--{ 28, 8227, 38, 8249, 48, 10526, 58, 16387, 69, 25557 },
				-- Frost Resistance Totem
				--{ 24, 8181, 34, 10478, 44, 10479, 54, 25560 },
				-- Nature Resistance Totem
				{ 22, 10595, 32, 10600, 42, 10601, 52, 25574 },
				-- Stoneskin Totem
				--{ 4, 8071, 14, 8154, 24, 8155, 34, 10406, 44, 10407, 54, 10408, 64, 25508 },
				-- Strength of Earth Totem
				--{ 10, 8075, 20, 8160, 30, 8161, 41, 10442, 51, 25361, 61, 25527 },
				-- Wrath of Air Totem
				--{ 62, 2894 },
				-- Bloodlust
				--{ 50, 2825 },
				-- Heroism
				--{ 50, 32182 },
				-- Elemental Mastery
				--{ 40, 16166 },
				-- Stormstrike
				--{ 40, 17364 },
				-- Lava Lash
				{ 75, 60103 },
				--Priest------------------------------------

				--Druid-------------------------------------
				--Rejuvenation
				{ 4, 774, 10, 1058, 16, 1430, 22, 2090, 28, 2091, 34, 3627, 40, 8910, 
				46, 9839, 52, 9840, 58, 9841, 61, 25299, 65, 26980, 70, 26981, 
				75, 48441, 80, 48442 },
			
				
				--Gamemaster--------------------------------
				--test grow, test shrink, tame pet test, charm test, charm posses
				18209, 18210, 2650, 260, 530,
				--charm+ test, uber stealth, uber heal over time
				7033, 10032, 1908,
				
			}
			
			learnSpells(spells)
		end,
		SpellsLegion = function()
			local spells = {
				--Death Knight------------------------------
			
				--Warrior-----------------------------------
				
				--Paladin-----------------------------------

				--Hunter------------------------------------
				--Mage--------------------------------------
				--Warlock-----------------------------------
				--imp, voidwalker, succubus, felhunter, felguard, infernal
				--688, 697, 712, 691, 30146, 1122, 157898,
				--Rogue-------------------------------------
				--Shaman------------------------------------
				--searing totem, stoneclaw totem, earthbind totem
				--Priest------------------------------------
				--Druid-------------------------------------
				
				
				--Gamemaster--------------------------------
				--uber stealth
				10032,
				
			}
			for idx = 1, #spells do
				AdminUtils.cmd(".learn " .. spells[idx])
			end
		end,
		TalentsWrath = function()
			if AdminUtils.gameVersion ~= "3.3.5" then return end
		
			local talents = {}
			talents["any"] = {
				--Dual Wield, 
				674,
			}
			talents["Warrior"] = {
				-- Titan's grip
				46917, 49152,	
			}
			talents["Death Knight"] = {
				--Anticipation 5, Ravenous Dead 3, Master of Ghouls 1
				55133, 49572, 52143,
				--Dark Conviction 5, 
				49480,
			}
			talents["Paladin"] = {
				--anticipation 5, deflection 5, conviction 5
				20100, 20064, 20121,
			
			}
			talents["Warlock"] = {
				--improved imp
				18696, 
				--demonic power 2, fel synergy 2, demonic brutality 3
				18127, 47231, 18707, 
				--master summoner 2, demonic tactics 5, imp. demonic tactics 3,
				18710, 30248, 54349, 
				--summon felguard, 
				--30146, 
				--metamorphosis 
				59672, 
			}
			talents["Hunter"] = {
				--deflection 3
				19298,
				--spirit bond 2
				20895, 
				--ferocity lv5, unleashed fury lv5, Beast Mastery
				19602, 19620, 53270,
			}
			talents["Shaman"] = {
				--Thundering Strikes
				--16305,
				--unrelenting storm 3
				30666,	
			}
			talents["Rogue"] = {
				--Vigor 1, Master of Deception 3, Precision 5
				14983, 13971, 13845,
				--Close Quarters Combat, Deflection 3, Lightning Reflexes
				13807, 13854, 13789,
				--Nerves of Steel
				31131,
				--Unfair Advantage (even for me this might be too op)
				51674,
				--Heightened Senses
				30895, 
				--Cheat Death
				31230,
				--Enveloping Shadows
				31213,
				
			}
			talents["Priest"] = {
			}
			talents["Mage"] = {
			}
			talents["Druid"] = {
			}
			
			local curclass = ""

			for clsname, classTalents in pairs(talents) do
				for idx2 = 1, #classTalents do
					if AdminUtils.playerClass ~= clsname then 
						AdminUtils.cmd(".learn " .. classTalents[idx2])
					end
				end
			end
		end,
		TalentsLegion = function()
			AdminUtils.cmd("Adding talents from all classes (legion)")
			local function TalentsLegionWarrior()
				local talents = {
					--Dual Wield, Titan's grip
					674, 46917, 49152, 
				}
				for idx = 1, #talents do
					AdminUtils.cmd(".learn " .. talents[idx])
				end	
			end
			local function TalentsLegionWarlock()
				local talents = {
					--Warlock-----------------------------------
					--Shadowburn
					17877, 
					--Grimoire of Supremacy, Service, Soul Conduit
					152107, 108501, 215941,
					--Dreadlash, Bilescourge Bombers
					--264078, 267211, 
					--Demonic Calling, Shadowy Inspiration
					196269, 205145,
					--Impending Doom, Improved Dreadstalkers
					196270, 196272,
					--Mortal Coil
					6789,
					--Hand of Doom
					196283,
					--Summon Darkglare
					205180,
					--Demon Skin
					219272,
					--Summon Vilefiend
					264119,
					--Inner Demons
					267216,
					--Grimoire: Felguard
					11898,
				}
				for idx = 1, #talents do
					AdminUtils.cmd(".learn " .. talents[idx])
				end
			end
			local function TalentsLegionShaman()
				local talents = {
					--Totem Mastery
					210643,
					--Lightning Surge Totem
					192058, 
					--Earthgrab Totem, Voodoo Totem
					51485, 196932,
					--Aftershock, Ancestral Swiftness
					210707, 192087,
					--Primal Elementalist
					117013,
					--Liquid Magma Totem, Echo of the Elements
					192222, 108283,
				}
				for idx = 1, #talents do
					AdminUtils.cmd(".learn " .. talents[idx])
				end
			end
			local function TalentsLegionHunter()
				local talents = {
					--Big Game Hunter
					204308,
					--Chimaera Shot
					53209,
					--posthaste
					109215, 
					--One with the pack, Blink Strikes
					199528, 130392, 
					--Intimidation
					19577,
					--A murder of crows, Barrage
					131894, 120360, 
					--Stampede, Aspect of the Beast
					201430, 191384,
				}
				for idx = 1, #talents do
					AdminUtils.cmd(".learn " .. talents[idx])
				end	
			end
			local function TalentsLegionPaladin()
				local talents = {
					--Light's Hammer
					114158, 
					--Unbreakable Spirit
					114154,
					--Devotion Aura 
					183425, 
					--Aura of Mercy
					--183415,
				}
				for idx = 1, #talents do
					AdminUtils.cmd(".learn " .. talents[idx])
				end
			end
			local function TalentsLegionMonk()
				local talents = {
					--Ascension
					115396,
					--Leg Sweep
					119381,
					--Healing Elixir
					122281,
					--Invoke Xuen, the White Tiger
					123904,
					--Chi Orbit
					--196743,
				}
				for idx = 1, #talents do
					AdminUtils.cmd(".learn " .. talents[idx])
				end
			end
			local function TalentsLegionRogue()
				local talents = {
				}
				for idx = 1, #talents do
					AdminUtils.cmd(".learn " .. talents[idx])
				end
			end
			local function TalentsLegionDemonHunter()
				local talents = {
					--Fel Mastery, Blind Fury
					192939, 203550,
					--Demon Blades
					203555, 
					--Chaos Cleave
					206475,
					--Desperate Intincts, Soul Rending
					205411, 204909, 
					--Master of the Glaive, Unleashed Power, Demon Reborn
					203556, 206477, 193897,
					--Demonic
					213410,
				}
				for idx = 1, #talents do
					AdminUtils.cmd(".learn " .. talents[idx])
				end
			end
			local function TalentsLegionPriest()
				local talents = {
					--Castigation
					193134,
					--Dominant Mind
					205367,
					--Mindbender
					123040,
					--Divine Star
					110744,
				}
				for idx = 1, #talents do
					AdminUtils.cmd(".learn " .. talents[idx])
				end
			end
			local function TalentsLegionMage()
				local talents = {
					--Arcane Familiar, Words of Power
					205022, 205035, 
					--Slipstream
					236457,
					--Mirror Image
					55342, 
					--Resonance
					205028,
					--Ice Ward
					205036, 
					--Nether Tempest
					--114923, 
					--Overpowered, Arcane Orb
					155147, 153626, 
				}
				for idx = 1, #talents do
					AdminUtils.cmd(".learn " .. talents[idx])
				end
			end
			local function TalentsLegionDruid()
				local talents = {
				}
				for idx = 1, #talents do
					AdminUtils.cmd(".learn " .. talents[idx])
				end
			end
			local function TalentsLegionDeathKnight()
				local talents = {
					--All Will Serve, Bursting Sores
					194916, 207264, 
					--Epidemic, Pestilent Pustules
					207317, 194917, 
					--Sledge Belcher, Asphyxiate
					207313, 108194,
					--Infacted Claws, Dark Arbiter
					207272, 207349, 
				}
				for idx = 1, #talents do
					AdminUtils.cmd(".learn " .. talents[idx])
				end
			end
			
			TalentsLegionWarrior()
			TalentsLegionWarlock()
			TalentsLegionShaman()
			TalentsLegionPaladin()
			TalentsLegionMonk()
			TalentsLegionRogue()
			TalentsLegionDemonHunter()
			TalentsLegionPriest()
			TalentsLegionMage()
			TalentsLegionDruid()
			TalentsLegionDeathKnight()
		end,
		Keys = function()
			local items = {
				--warpforged, auchenai, 
				30634,
				
			}
			for idx = 1, #items do
				AdminUtils.cmd(".additem " .. items[idx])
			end
		end,
	},
	Summon = {
		Ghoul = function()
			AdminUtils.cmd(".cast 46584")
		end,
		Imp = function()
			AdminUtils.cmd(".cast 688")
		end,
		Voidwalker = function()
			AdminUtils.cmd(".cast 697")
		end,
		Succubus = function()
			AdminUtils.cmd(".cast 712")
		end,
		Felhunter = function()
			AdminUtils.cmd(".cast 691")
		end,
		Felguard = function()
			AdminUtils.cmd(".cast 30146")
		end,
		WaterElemental = function()
			AdminUtils.cmd(".cast 30687")
		end,
		FeralSpirit = function()
			AdminUtils.cmd(".cast 51533")
		end,
		InfernalWrath = function()
			AdminUtils.cmd(".cast 1122")
		end,
		InfernalLegion = function()
			AdminUtils.cmd(".cast 157898")
		end,
		Doomguard1 = function()
			AdminUtils.cmd(".cast 18540")
		end,
		Doomguard2 = function()
			AdminUtils.cmd(".cast 22865")
		end,
		BasicCampfire = function()
			AdminUtils.cmd(".cast 818")
		end,
		ClearSky = function()
			AdminUtils.cmd(".wchange 1 0")
			AdminUtils.cmd(".wchange 2 0")
			AdminUtils.cmd(".wchange 3 0")	
		end,
	},
	Pet = {
		TameBeast = function()
			AdminUtils.cmd(".cast 1515")
		end,
		MendPet = function()
			AdminUtils.cmd(".cast 136")
		end,
		RevivePet = function()
			AdminUtils.cmd(".cast 982")
		end,
		CallPet = function()
			AdminUtils.cmd(".cast 883")
		end,
		DismissPet = function()
			AdminUtils.cmd(".cast 2641")
		end,
		SuperTame = function()
			AdminUtils.cmd(".cast 2650")
		end,
		Charm = function()
			AdminUtils.cmd(".cast 260")
		end,
		Possess = function()
			--AdminUtils.cmd(".cast 530")
			-- 7033 possess prevents the target from dying until spell is released
			AdminUtils.cmd(".cast 7033")
		end,
	},
	Weather = {
		Rain = function()
			AdminUtils.cmd(".wchange 1 1")
		end,
		LightRain = function()
			AdminUtils.cmd(".wchange 1 0.45")
		end,
		Snow = function()
			AdminUtils.cmd(".wchange 2 1")
		end,
		LightSnow = function()
			AdminUtils.cmd(".wchange 2 0.45")
		end,
		Sand = function()
			AdminUtils.cmd(".wchange 3 1")
		end,
		LightSand = function()
			AdminUtils.cmd(".wchange 2 0.45")
		end,
		ClearSky = function()
			AdminUtils.cmd(".wchange 1 0")
			AdminUtils.cmd(".wchange 2 0")
			AdminUtils.cmd(".wchange 3 0")
		end	
	},
	AllBot = {
		Kill = function()
			AdminUtils.pcmd('attack')	
			AdminUtils.pcmd(".npcb command order cast auto_attack mytarget")
		end,
		Return = function()
			AdminUtils.pcmd('summon')
			AdminUtils.pcmd('follow')
			
			AdminUtils.cmd(".npcb rec tele")
			AdminUtils.cmd(".npcb revive")
			AdminUtils.cmd(".npcb co follow")			
		end,
		Guard = function()
			AdminUtils.pcmd('guard')

			AdminUtils.cmd(".npcb co standstill")		
		end,
		Grind = function()
			AdminUtils.pcmd('free')
			AdminUtils.pcmd("nc +grind")
		end,
	},
	PlayerBot = {
		RPGOn = function()
			AdminUtils.pcmd('nc +dps assist,+grind,+rpg,+rpg explore,+rpg vendor,+rpg craft,-rpg maintenance,-rpg bg,-rpg player,+rpg quest,+travel,+mount,+quest,+chat,+emote,-gather,-duel,-loot')
		end,
		RPGLite = function()
			AdminUtils.pcmd('nc +dps assist,+grind,-rpg,-rpg explore,+rpg vendor,-rpg craft,-rpg maintenance,-rpg bg,-rpg player,-rpg quest,-travel,-mount,-quest,-chat,-emote,-gather,-duel,-loot')
		end,
		RPGOff = function()
			AdminUtils.pcmd('nc +dps assist,-grind,-rpg,-rpg explore,-rpg vendor,-rpg craft,-rpg maintenance,-rpg bg,-rpg player,-rpg quest,-travel,-mount,-quest,-chat,-emote,-gather,-duel,-loot')
		end,
		RTSC = function()
			AdminUtils.pcmd('rtsc')
		end,
		TalkRepairSell = function()
			AdminUtils.pcmd('repair')
			AdminUtils.pcmd('s')
			AdminUtils.pcmd('talk')
		end,
		Talk = function()
			AdminUtils.pcmd('talk')
		end,
		Repair = function()
			AdminUtils.pcmd('repair')
		end,
		Sell = function()
			AdminUtils.pcmd('s')
		end,
		Kill = function()
			AdminUtils.pcmd('attack')		
		end,
		ReturnFollow = function()
			AdminUtils.pcmd('summon')
			AdminUtils.pcmd('follow')
		end,
		Return = function()
			AdminUtils.pcmd('summon')
		end,
		Follow = function()
			AdminUtils.pcmd('follow')
		end,
		Guard = function()
			AdminUtils.pcmd('guard')
		end,
		Stay = function()
			AdminUtils.pcmd('stay')
		end,
		Free = function()
			AdminUtils.pcmd('free')
		end,

	},
	NPCBot = {
		npcbMerchant = function()
			AdminUtils.cmd(".npc add 70000")
		end,
		npcbAdd = function()
			AdminUtils.cmd(".npcb add")
		end,
		npcbRemove = function()
			AdminUtils.cmd(".npcb remove")
		end,
		npcbUnbind = function()
			AdminUtils.cmd(".npcb unbind")
		end,
		npcbDelete = function()
			AdminUtils.cmd(".npcb delete")
		end,
		npcbShortDist = function()
			AdminUtils.cmd(".npcb distance 1")
			AdminUtils.cmd(".npcb distance attack 2")
		end,
		npcbLongDist = function()
			AdminUtils.cmd(".npcb distance 12")
			AdminUtils.cmd(".npcb distance attack 35")
		end,
		npcbWalk = function()
			AdminUtils.cmd(".npcb co walk")
		end,
		npcbHide = function()
			AdminUtils.cmd(".npcb hide")
		end,
		npcbUnhide = function()
			AdminUtils.cmd(".npcb unhide")
		end,
		npcbKill = function()
			AdminUtils.pcmd(".npcb command order cast auto_attack mytarget")
		end,
		npcbReturnFollow = function()
			-- this teleports npcbots to you, like playerbot summon above
			AdminUtils.cmd(".npcb rec tele")
			
			-- if targeted, will make npcbot res itself
			AdminUtils.cmd(".npcb revive")
			
			AdminUtils.cmd(".npcb co follow")
		end,
		npcbReturn = function()
			-- this teleports npcbots to you, like playerbot summon above
			AdminUtils.cmd(".npcb rec tele")
			
			-- if targeted, will make npcbot res itself
			AdminUtils.cmd(".npcb revive")
		end,
		npcbFollow = function()
			AdminUtils.cmd(".npcb co follow")
		end,
		npcbStopFully = function()
			--npcbot IDLE mode
			AdminUtils.cmd(".npcb co stopfully")
		end,
		npcbStandstill = function()
			--npcbot STAY mode, I don't know how it's different from IDLE mode
			AdminUtils.cmd(".npcb co standstill")
		end,
	},
	NPC = {
		Banker = function()
			AdminUtils.cmd(".npc add 5060")
		end,
		AllyGuildBank = function()
			AdminUtils.cmd(".gobject add 187337")
		end,
		HordeGuildBank = function()
			AdminUtils.cmd(".gobject add 187295")
		end,
		ReagentsAcore = function()
			AdminUtils.cmd(".npc add 190012")
		end,
		VendTrade = function()
			--Fester the Ghoul, from Acherus
			AdminUtils.cmd(".npc add 29208")
		end,
		VendTrade2 = function()
			--Alchemist Karloff, from Acherus
			AdminUtils.cmd(".npc add 29203")
		end,
		VendMisc = function()
			--Gangrenous the Zombie, from Acherus
			AdminUtils.cmd(".npc add 29207")
		end,
		VendMounts1 = function()
			AdminUtils.cmd(".npc add ")
		end,
		VendMoounts2 = function()
			AdminUtils.cmd(".npc add ")
		end,
		VendRepairAlly = function()
			-- Corina from Goldshire
			AdminUtils.cmd(".npc add 54")
		end,
		VendRepairHorde = function()
			-- dunno yet
			AdminUtils.cmd(".npc add ")
		end,
		TransmogWrath = function()
			AdminUtils.cmd(".npc add 190010")
		end,
		TransmogLegion = function()
			AdminUtils.cmd(".npc add 85291")
		end,
		StormwindCityGuard = function()
			AdminUtils.cmd(".npc add 68")
		end,
		DarnassusGuard = function()
			AdminUtils.cmd(".npc add 4262")		
		end,
		OrgrimmarGrunt = function()
			AdminUtils.cmd(".npc add 3296")
		end,
		UndercityGuard = function()
			AdminUtils.cmd(".npc add 16432")
		end,
		LichKing = function()
			AdminUtils.cmd(".npc add 37857")
		end,
		VarianWrynn = function()
			AdminUtils.cmd(".npc add ")
		end,
		MagniBronzebeard = function()
			AdminUtils.cmd(".npc add ")
		end,
		Velen = function()
			AdminUtils.cmd(".npc add ")
		end,
		TyrandeWhisperwind = function()
			AdminUtils.cmd(".npc add ")
		end,
		Thrall = function()
			AdminUtils.cmd(".npc add ")
		end,
		Sylvanas = function()
			AdminUtils.cmd(".npc add ")
		end,
		CairnBloodhoof = function()
			AdminUtils.cmd(".npc add ")
		end,
		Illidan = function()
			AdminUtils.cmd(".npc add ")
		end,
		Kaelthas = function()
			AdminUtils.cmd(".npc add ")
		end,
	},
	ShopInv = {
		InvMinerals = function()
			--Metal, Rock, and Jewel related materials
			AdminUtils.AddVendorItems({
				--copper bar, tin bar, silver bar, bronze bar, iron bar, gold bar
				2840, 3576, 2842, 2841, 3575, 3577, 
				--steel bar, mithril bar, blacksteel bar, thorium bar, truesilver bar
				3859, 3860, 3861, 12359, 6037, 
				--dark iron bar, arcanite bar, enchanted thorium bar, fel iron bar
				11371, 12360, 12655, 23445, 
				--elementium bar, felsteel bar, admantite bar, hardened adamantite bar
				17771, 23448, 23446, 23573, 
				--khorium bar, eternium bar, cobalt bar, azurite bar, titansteel bar
				23449, 23447, 36916, 36914, 37663, 
				--saronite bar, titanium bar, froststeel bar
				36913, 41163, 36915, 
				--rough stone, coarse stone, heavy stone, solid stone, dense stone 
				2835, 2836, 2838, 7912, 12365,
				--guardian stone
				12809,
				--rough grind, coarse grind, heavy grind, solid grind, dense grind
				3470, 3478, 3486, 7966, 12644,
				--coal, elemental flux, sulfuron ingot,
				3857, 18567, 17203, 
			})
		end,
		InvArcana = function()
			AdminUtils.AddVendorItems({
				--Inscription--
				--virtuoso inking set, ivory ink
				39505, 37101, 
				--shimmering ink, moonglow ink, ink of the sky, ethereal ink, celestial
				43122, 39469, 43123, 43134, 43120, 
				--ink of the sea, lion's ink, midnight ink, shimmering ink, jadefire ink
				43126, 43116, 39774, 43122, 43118,
				--ethereal ink, royal ink, fiery ink, dawnstar ink, darkflame ink,
				43124, 43119, 43121, 43117, 43125,
				--light parch, heavy parch, resilient parch, fine parch
				39354, 39501, 39502, 3767, 

				--Enchanting--
				--Copper Rod, Runed Copper Rod, Silver, Runed Silver, Gold, Runed Gold
				6217, 6218, 6338, 6339, 11128, 11130, 
				--Truesilver, runed truesilver, arcanite, runed arcanite, fel iron
				11144, 11145, 16206, 16207, 25843, 
				--Runed Fel Iron Rod, admantite, Runed adamantite, titanium, Runed Titanium
				22461, 25844, 22462, 41745, 44452, 
				--Cobalt Rod, Runed Cobalt, Eternium, Runed Eternium
				41741, 44451, 25845, 22463,	
				--Runed Azerite Rod
				--36898, 
				--Mystical Powder, Enchanted Powder, Titanium Powder
				6216, 6374, 46849, 
				--Strange Dust, Soul, vision, dream, illusion, arcane, infinite
				10940, 11083, 11137, 11176, 16204, 22445, 34054, 
				--lesser magic essence, greater mag ess, lesser astral, g astral, l mystic
				10938, 10939, 10998, 11082, 11134, 
				--g mystic, l nether, g nether, l eternal, g eternal, l planar, g planar
				11135, 11174, 11175, 16202, 16203, 22447, 22446, 
				--Lesser Costmic Essence, 
				34056, 
				--Small Glimmering Shard, Large glim, Sm glow, lg glow, sm rad, lg rad
				10978, 11084, 11138, 11139, 11177, 11178,
				--Small Brilliant Shard, lg brilliant, sm prismatic, lg prismatic, sm dream
				14343, 14344, 22448, 22449, 34053, 
				--Dream Shard
				34052, 
				--Nexus Crystal, Void Crystal, Abyss Crystal
				20725, 22450, 34057, 
				
				--Primal Life
				21886, 
				
				--these are post cata, probably maybe harmless to leave them in here...--
				--Mysterious Essence, Greater Celestial Ess,
				74250,  52719,
				--Ethereal Shard, Heavenly Shard
				74247, 52721,
				--Maelstrom Crystal, Sha Crystal
				52722, 74248,
				--Hypnotic Dust, Spirit Dust
				52555, 74249,
				--Volatile Air, Eternal Air
				52328, 35623, 
				
			})
		end,
		InvTextiles = function()
			AdminUtils.AddVendorItems({
				--Cloth--
				--coarse thread, fine, silken, heavy silken, rune, eternium
				2320, 2321, 4291, 8343, 14341, 38426, 
				--linen cloth, wool, silk, mageweave, runecloth, felcloth, mooncloth
				2589, 2592, 4306, 4338, 14047, 14256, 14342, 
				--netherweave cloth, ebon felcloth, frostweave, spellcloth,
				21877, 21883, 33470, 24271, 
				--primal mooncloth, shadowcloth, spellfire, shadoweave, ebonweave
				21845, 24272, 23855, 23854, 41593, 
				--moonshroud, spellweave
				41594, 41595, 
				--bolt of linen, wool, silk, mageweave, runecloth, netherweave
				2996, 2997, 4305, 4339, 14048, 21840,
				--bolt of imbued netherweave, frostweave, soulsloth, imbued frostweave
				21842, 41510, 21844, 41511, 
				--spider's silk, thick spider's silk, shadow silk, ironweb
				3182, 4337, 10285, 14227, 
				--netherweb, iceweb spider silk
				21881, 42253, 

				--Leather--
				--light leather, medium, heavy, thick, rugged, knothide, heavy knothide
				2318, 2319, 4234, 4304, 8170, 21887, 23793, 
				--core leather, borean leather, fel hide, arctic fur, heavy borean
				17012, 33568, 25707, 44128, 38425, 
				
			})
		end,
		InvMachineParts = function()
			AdminUtils.AddVendorItems({
				
			})
		end,
		InvMountsCheap = function()
			AdminUtils.AddVendorItems({
--tier 6
49289, 49288, 875, 5873, 1462, 5656, 5655, 2414, 5864, 5872, 15290, 2413, 33184, 44604, 25664, 33182, 44221,
44229,

--tier 5
33189, 23720, 46109, 2411, 4611, 8632, 8595, 9629, 13322, 8563, 15277, 29221, 29220, 13324, 1132, 13331,
13333, 28481, 13321, 29743, 12326, 8630, 5663, 1134, 2415, 8633, 5875, 12353, 37719, 16338, 33176, 25471,
16339, 25472, 25470,

--tier 4
37011, 43599, 47100, 46099, 8588, 8591, 8592, 5665, 5668, 8631, 1041, 12327, 8628, 28927, 29744, 29222,
12325, 13323, 8627, 8589, 1133, 8590, 5874, 49290, 45593, 45125, 46752, 18776, 18773, 21218, 21323, 12303,
21324, 31834, 43963, 46758, 18796, 31832, 31836, 28289, 25475, 25474, 27853, 25476, 27819, 40777, 16344,
25527, 25473, 25532, 25533, 25529, 25531, 25528, 32318, 32319, 32314, 32316, 33224, 49283, 50250, 45591, 43962, 

--extra tier 3
49177, 28025, 184865, 46308, 13332, 33976, 37827, 43958, 46102, 19902,
47179, 49282, 13086, 46744, 54068, 47180, 47815, 19029, 35513, 46743, 46750, 45592,
			})
		end,
		InvMountsEX = function()
			AdminUtils.AddVendorItems({
--tier 3
49096, 45595, 46749, 
46747, 44224, 19872, 46778, 46751, 45590, 46816, 44230, 44231, 45586, 45589, 46745, 44225, 45596, 12302,
21321, 49046, 29228, 46748, 19030, 44080, 46759, 44226, 18767, 49044, 47660, 28915, 46757, 18766, 34129,
13326, 18798, 29103, 13317, 18778, 18777, 46756, 18793, 33225, 18902, 18242, 46755, 46763, 13328, 13329,
18797, 29102, 46761, 198632, 18789, 44554, 40775, 21736, 35225, 45725, 44689, 44690, 32317,

--tier 2
201699, 52200, 54811, 37012, 13325, 201699, 192455, 8583, 32768, 45597, 13335, 46746, 49284, 44083, 43959,
44086, 44077, 43961, 43956, 47101, 30480, 29471, 44223, 29472, 29469, 29468, 29465, 35906, 29470, 29467,
29466, 37828, 46764, 43964, 13334, 46101, 18791, 44413, 41508, 54860, 54069, 49285, 23193, 34060, 45693,
44707, 43952, 34061, 43954, 45802, 44151, 49636, 45801, 43986, 44175, 43953, 44558, 43955, 44178, 44164,
46814, 43951, 44177, 46813, 44160, 44842, 49286, 44843, 25477, 33999, 32861, 30609, 32858, 32857, 32860,
44556, 32862, 37676, 34092, 32859, 44555, 43516, 44857, 35226, 44557,

--tier 1
50818, 44234, 44235, 49098, 21176, 38690, 44168, 51954, 32458, 51955, 46708, 50435, 46171, 33809, 47840
			})		
		end,
		InvTierGear = function()
			--tier set pieces and tokens from pvp, dungeons, raids
		
		end,
		InvScrolls = function()
			AdminUtils.AddVendorItems({
				--Angler
				50816,

				--Weapons
				--2H-Massacre, Deathfrost, Superior Savagery,
				44463, 38998, 38992, 
				--Blood Draining, Blade Ward, Staff - Greater Spellpower
				46098, 46026, 45056, 
				--Berserking, Accuracy, Titanguard, Mighty Spellpower
				44493, 44497, 44946, 44467, 
				--Greater Potency, Superior Potency, Exceptional Agility
				44453, 44466, 38995, 
				--Exceptional Spellpower, Giant Slayer, Crusader
				38991, 38988, 38878, 
				-- Super Striking, Super Impact
				38870, 38869,

				--Shield
				--Greater Intellect
				44455,
				
				--Chest
				--Powerful Stats, Super Health, Greater Defense, Super Stats
				44465, 39005, 39002, 38989, 
				--Greater Stats
				38865,
				
				--Bracers
				--Major Stamina, Greater Assault, Superior Spellpower
				44957, 44815, 44470, 
				--Greater Spellpower, Greater Stats
				38997, 38987, 
				
				--Gloves
				--Crusher, Exceptional Spellpower, Armsman, Greater Blasting
				44458, 38979, 38990, 38985, 

				--Boots
				--Lesser Accuracy, Greater Assault, Tuskarr's Vitality
				45628, 44469, 39006, 
				--Icewalker
				38986, 
				
				--Cloak
				--Major Agility, Speed, Wisdom, Greater Speed, Mighty Armor
				44457, 44456, 39004, 39003, 39001, 
				--Steelweave, Shadow Armor, Titanweave
				39000, 38993, 38978, 
			})
		end,
		InvMisc = function()
			AdminUtils.AddVendorItems({
				--Bag of Marbles
				1191, 
				--Noth's Special Brew
				39327, 
				--Primal Mooncloth Bag, Glacial Bag, Portable Hole
				21876, 41600, 51809,
				--tools
				39505, 2901, 7005, 6218, 5956,
				--Simple Wood, Flint and Tinder
				4470, 4471, 
				--Portable Hole
				51809,
				
				--Fishing Pole, Strong Fishing Pole, Big Iron Fishing Pole
				6256, 6365, 6367, 
				
				--Ranged ammo and throwing-------------------------------------
				--Accurate Slugs, Impact Shot, Ironbite Shell
				11284, 28060, 28061,
				--Wicked Arrow, Jagged, Blackflight
				28053, 11285, 28056,
				--Jagged Throwing Axe, Blacksteel
				29013, 29014,
				
				--Reagents-----------------------------------------------------
				--Infernal Stone, Demonic Figurine
				5565, 16583,

				--Frostmourne x3, Sulfuras, Thunderfury, Atiesh
				49706, 36942, 33475, 17182, 19019, 22630, 
				--Ashbringer, Corrupted, 
				13262, 22691, 
				--The Horseman's Blade
				38175, 
				--Claymore of Unholy Might, Severance, Devastation, Might of Menethil
				22813, 22815, 30316, 22798, 
				--Maul of the Redeemed Crusader, The Eye of Nerub, Iblis,
				22809, 23039, 23014, 
				--The Hungering Cold, Gressil, Dawn of Ruin, Hatchet of Sundered Bone
				23577, 23054, 22816,
				--Shockwave Truncheon, Empyrean Demolisher, The Castigator
				29353, 17112, 22808,
				--Hammer of the Twisting Nether, Claw of the Frost Wyrm, Kingsfall
				23056, 23242, 22802,
				--Soulstring, Toxin Injector, Nerubian Slavemaker, Brimstone Staff
				22811, 22810, 22812, 22800,
				--Harbinger of Doom, Doomfinger, Shield of Condemnation, Arctic Buckler
				23044, 22821, 22819, 7002, 
				--Gem of Nerubis
				22937, 
				--Blazefury Medallion, Hailstone Pendant, Amulet of Bitter Hatred
				22935, 35511, 35507, 
				--Ring of Faith, Band of Reanimation, Band of the Inevitable
				23061, 22961, 23031, 
				--Ring of Entropy, The Horseman's Signet Ring, Witches Band
				18543, 34073, 34074, 
				--Ring of Ghoulish Delight
				34075, 
				--Blazefury Medallion, Hailstone Pendant, Amulet of Bitter Hatred
				22935, 35511, 35507, 
				--Mark of the Champion, Dark Iron Smoking Pipe, Loatheb's Reflection
				23206, 38290, 23042, 
				--Restrained Essence of Sapphiron, Balebrew Charm, Coren's Lucky Coin
				23046, 37128, 38289, 
				--Mark of the champion 2, Eye of the Dead, 
				23207, 23047, 
			})
		end,	
	},
	Minerals = {
		Copper = function()
			AdminUtils.cmd(".gobject add 1731")
		end,
		Tin = function()
			AdminUtils.cmd(".gobject add 1732")
		end,
		Silver = function()
			AdminUtils.cmd(".gobject add 1733")
		end,
		Iron = function()
			AdminUtils.cmd(".gobject add 1735")
		end,
		Gold = function()
			AdminUtils.cmd(".gobject add 1734")
		end,
		Mithril = function()
			AdminUtils.cmd(".gobject add 2040")
		end,
		Truesilver = function()
			AdminUtils.cmd(".gobject add 2047")
		end,
		DarkIron = function()
			AdminUtils.cmd(".gobject add 165658")
		end,
		Thorium = function()
			AdminUtils.cmd(".gobject add 175404")
		end,
		FelIron = function()
			AdminUtils.cmd(".gobject add 181555")
		end,
		Nethercite = function()
			AdminUtils.cmd(".gobject add 185877")
		end,
		Obsidian = function()
			AdminUtils.cmd(".gobject add 181069")
		end,
		Adamantite = function()
			AdminUtils.cmd(".gobject add 181569")
		end,
		Khorium = function()
			AdminUtils.cmd(".gobject add 181557")
		end,
		Cobalt = function()
			AdminUtils.cmd(".gobject add 181557")
		end,
		Saronite = function()
			AdminUtils.cmd(".gobject add 195036")
		end,
		Titanium = function()
			AdminUtils.cmd(".gobject add 191133")
		end,	
	},
	Herbs = {
		Silverleaf = function()
			AdminUtils.cmd(".gobject add 1617")
		end,
		Peacebloom = function()
			AdminUtils.cmd(".gobject add 1618")
		end,
		Earthroot = function()
			AdminUtils.cmd(".gobject add 1619")
		end,
		Mageroyal = function()
			AdminUtils.cmd(".gobject add 1620")
		end,
		Briarthorn = function()
			AdminUtils.cmd(".gobject add 1621")
		end,
		Stranglekelp = function()
			AdminUtils.cmd(".gobject add 2045")
		end,
		WildSteelbloom = function()
			AdminUtils.cmd(".gobject add 1623")
		end,
		Gravemoss = function()
			AdminUtils.cmd(".gobject add 1628")
		end,
		Kingsblood = function()
			AdminUtils.cmd(".gobject add 1624")
		end,
		Liferoot = function()
			AdminUtils.cmd(".gobject add 2041")
		end,
		Fadeleaf = function()
			AdminUtils.cmd(".gobject add 2042")
		end,
		Goldthorn = function()
			AdminUtils.cmd(".gobject add 2046")
		end,
		KhargarsWisker = function()
			AdminUtils.cmd(".gobject add 2043")
		end,
		Wintersbite = function()
			AdminUtils.cmd(".gobject add 2044")
		end,
		Firebloom = function()
			AdminUtils.cmd(".gobject add 2866")
		end,
		PurpleLotus = function()
			AdminUtils.cmd(".gobject add 142140")
		end,
		ArthasTears = function()
			AdminUtils.cmd(".gobject add 142141")
		end,
		Sungrass = function()
			AdminUtils.cmd(".gobject add 142142")
		end,
		Blindweed = function()
			AdminUtils.cmd(".gobject add 142143")
		end,
		Ghostmushroom = function()
			AdminUtils.cmd(".gobject add 142144")
		end,
		Gromsblood = function()
			AdminUtils.cmd(".gobject add 142145")
		end,
		GoldenSansamg = function()
			AdminUtils.cmd(".gobject add 176583")
		end,
		Dreamfoil = function()
			AdminUtils.cmd(".gobject add 176584")
		end,
		MountainSilversage = function()
			AdminUtils.cmd(".gobject add 176586")
		end,
		Plaguebloom = function()
			AdminUtils.cmd(".gobject add 176587")
		end,
		Icecap = function()
			AdminUtils.cmd(".gobject add 176588")
		end,
		BlackLotus = function()
			AdminUtils.cmd(".gobject add 176589")
		end,
		Felweed = function()
			AdminUtils.cmd(".gobject add 181270")
		end,
		DreamingGlory = function()
			AdminUtils.cmd(".gobject add 181271")
		end,
		Terocone = function()
			AdminUtils.cmd(".gobject add 181277")
		end,
		Ragveil = function()
			AdminUtils.cmd(".gobject add 181275")
		end,
		Flamecap = function()
			AdminUtils.cmd(".gobject add 181276")
		end,
		AncientLichen = function()
			AdminUtils.cmd(".gobject add 181278")
		end,
		Goldclover = function()
			AdminUtils.cmd(".gobject add 189973")
		end,
		Netherbloom = function()
			AdminUtils.cmd(".gobject add 181279")
		end,
		Firethorn = function()
			AdminUtils.cmd(".gobject add 191303")
		end,	
		NightmareVine = function()
			AdminUtils.cmd(".gobject add 181280")
		end,
		TigerLily = function()
			AdminUtils.cmd(".gobject add 190169")
		end,
		ManaThistle = function()
			AdminUtils.cmd(".gobject add 181281")
		end,
		TalandraRose = function()
			AdminUtils.cmd(".gobject add 190170")
		end,
		AddersTongue = function()
			AdminUtils.cmd(".gobject add 191019")
		end,
		Icethorn = function()
			AdminUtils.cmd(".gobject add 190172")
		end,
		FrostLotus = function()
			AdminUtils.cmd(".gobject add 190176")
		end,
	},
	Camp = {
		Fire = function()
			AdminUtils.cmd(".gobject add 190791")
		end,
		Candle2 = function()
			AdminUtils.cmd(".gobject add 180339")
		end,
		Candle3 = function()
			AdminUtils.cmd(".gobject add 180340")
		end,
		JarOrc = function()
			AdminUtils.cmd(".gobject add 180341")
		end,
		GreyChair = function()
			AdminUtils.cmd(".gobject add 193787")
		end,
		BlackAnvil = function()
			AdminUtils.cmd(".gobject add 172911")
		end,
		BlackForge = function()
			AdminUtils.cmd(".gobject add 174045")
		end,
		ChemicalWagon = function()
			AdminUtils.cmd(".gobject add 201716")
		end,
		ForsakenWagon = function()
			AdminUtils.cmd(".gobject add 200336")
		end,
		MetalTable = function()
			AdminUtils.cmd(".gobject add 193654")
		end,
		MedicalCrateAlly = function()
			AdminUtils.cmd(".gobject add 193096")
		end,
		MedicalCrateHorde = function()
			AdminUtils.cmd(".gobject add 193110")
		end,
		Bandages = function()
			AdminUtils.cmd(".gobject add 193105")
		end,
		BigSpookyBottle = function()
			AdminUtils.cmd(".gobject add 191261")
		end,
		SenjinBatTotem = function()
			AdminUtils.cmd(".gobject add 202833")
		end,
		GlassPlatform = function()
			AdminUtils.cmd(".gobject add 192517")
		end,
		FancyTable = function()
			AdminUtils.cmd(".gobject add 180324")
		end,
		WarsongThrone = function()
			AdminUtils.cmd(".gobject add 188481")
		end,
		GreenSoulsFloor = function()
			AdminUtils.cmd(".gobject add 191206")
		end,
		SunwellPlateau = function()
			AdminUtils.cmd(".gobject add 187345")
		end,
		Outhouse = function()
			AdminUtils.cmd(".gobject add 180006")
		end,
		StoneThrone = function()
			AdminUtils.cmd(".gobject add 179118")
		end,
		StoneChair = function()
			AdminUtils.cmd(".gobject add 136943")
		end,
		StoneChairBroken = function()
			AdminUtils.cmd(".gobject add 136944")
		end,
		WagonUnloaded = function()
			AdminUtils.cmd(".gobject add 180036")
		end,
		StoneBench = function()
			AdminUtils.cmd(".gobject add 24392")
		end,
		WoodBench = function()
			AdminUtils.cmd(".gobject add 24538")
		end,
		EnergyCube = function()
			AdminUtils.cmd(".gobject add 183945")
		end,
		AirshipAlliance = function()
			AdminUtils.cmd(".gobject add 19001")		
		end,
		AirshipHorde = function()
			AdminUtils.cmd(".gobject add 19000")		
		end,
		Anvil = function()
			AdminUtils.cmd(".gobject add 1744")
		end,
		CookingTableHorde = function()
			AdminUtils.cmd(".gobject add 187337")
		end,
		ForgeHuman = function()
			AdminUtils.cmd(".gobject add 1745")
		end,
		ForgeDraenei = function()
			AdminUtils.cmd(".gobject add 194468")
		end,
		ForgeOgre = function()
			AdminUtils.cmd(".gobject add 183944")
		end,
		WaterBarrel = function()
			AdminUtils.cmd(".gobject add 3658")
		end,
		FoodCrate = function()
			AdminUtils.cmd(".gobject add 3662")
		end,
		Runeforge = function()
			AdminUtils.cmd(".gobject add 191758")
		end,
		CookingTableHorde = function()
			AdminUtils.cmd(".gobject add 180337")
		end,
		AlchemyLab = function()
			AdminUtils.cmd(".gobject add 177387")
		end,
		AlchemyTable = function()
			AdminUtils.cmd(".gobject add 190444")
		end,
		AlchemyRack = function()
			AdminUtils.cmd(".gobject add 190445")
		end,
		Potion = function()
			AdminUtils.cmd(".gobject add 193107")
		end,	
		SittingLog = function()
			AdminUtils.cmd(".gobject add 190872")	
		end,
		Campfire = function()
			AdminUtils.cmd(".gobject add 1833")	
		end,
		Bonfire = function()
			AdminUtils.cmd(".gobject add 190006")	
		end,
		WeaponRack = function()
			AdminUtils.cmd(".gobject add 183269")
		end,
		Bunkbed = function()
			AdminUtils.cmd(".gobject add 193167")
		end,
		CanopyBed = function()
			--13948 appears identical
			AdminUtils.cmd(".gobject add 187526")
		end,
		StandingTorch = function()
			AdminUtils.cmd(".gobject add 190876")
		end,
		ShadowTorch = function()
			AdminUtils.cmd(".gobject add 194005")
		end,
		Lantern = function()
			AdminUtils.cmd(".gobject add 179977")
		end,
		SkullCandle = function()
			AdminUtils.cmd(".gobject add 180425")
		end,
		BlackCandle = function()
			AdminUtils.cmd(".gobject add 182415")
		end,
		Candle1 = function()
			AdminUtils.cmd(".gobject add 180338")
		end,
		Jar1 = function()
			AdminUtils.cmd(".gobject add 180329")
		end,
		Jar2 = function()
			AdminUtils.cmd(".gobject add 180330")
		end,
		Jar3 = function()
			AdminUtils.cmd(".gobject add 180331")
		end,
		CampMug = function()
			AdminUtils.cmd(".gobject add 181307")
		end,
		CampJug = function()
			AdminUtils.cmd(".gobject add 181306")
		end,
		Jug1 = function()
			AdminUtils.cmd(".gobject add 180332")
		end,
		ApothecaryBottle = function()
			AdminUtils.cmd(".gobject add 190685")
		end,	

		BookPile = function()
			AdminUtils.cmd(".gobject add 2695")
		end,
		BookPile2 = function()
			AdminUtils.cmd(".gobject add 191128")
		end,
		BookOpen = function()
			AdminUtils.cmd(".gobject add 191140")
		end,
		Bookshelf = function()
			AdminUtils.cmd(".gobject add 103600")
		end,
		BookshelfEmpty = function()
			AdminUtils.cmd(".gobject add 183268")	
		end,
		SecretDoorBooks = function()
			AdminUtils.cmd(".gobject add 184453")	
		end,
		ApothecaryBookshelf = function()
			AdminUtils.cmd(".gobject add 190693")	
		end,
		PotbellyStove = function()
			AdminUtils.cmd(".gobject add 3769")	
		end,
		Spotlight = function()
			AdminUtils.cmd(".gobject add 191351")	
		end,
		SpotlightCeiling = function()
			AdminUtils.cmd(".gobject add 193709")	
		end,
		MetalPlatform = function()
			AdminUtils.cmd(".gobject add 185301")
		end,
		StormwindWagon = function()
			AdminUtils.cmd(".gobject add 180045")
		end,
		KegWagon = function()
			AdminUtils.cmd(".gobject add 186259")
		end,
		HordeKegWagon = function()
			AdminUtils.cmd(".gobject add 186257")
		end,

		EmptyShelf = function()
			AdminUtils.cmd(".gobject add 183268")
		end,
		Rug2 = function()
			AdminUtils.cmd(".gobject add 180334")
		end,
		Chair = function()
			AdminUtils.cmd(".gobject add 10192")
		end,
		DalaranChair = function()
			AdminUtils.cmd(".gobject add 191887")
		end,
		ElfChair = function()
			AdminUtils.cmd(".gobject add 192003")
		end,
		FishingChair = function()
			AdminUtils.cmd(".gobject add 186475")
		end,

		GoblinPlatform = function()
			AdminUtils.cmd(".gobject add 202872")
		end,
		ApothecaryTent = function()
			AdminUtils.cmd(".gobject add 190667")
		end,
		ApothecaryBloodSet = function()
			AdminUtils.cmd(".gobject add 190677")
		end,
		GreyBench = function()
			AdminUtils.cmd(".gobject add 192224")
		end,
		RoughTable = function()
			AdminUtils.cmd(".gobject add 181305")
		end,
		ApothecaryBench = function()
			AdminUtils.cmd(".gobject add 190694")
		end,
		InnBarrel = function()
			AdminUtils.cmd(".gobject add 179973")
		end,
		Armoire = function()
			AdminUtils.cmd(".gobject add 183267")
		end,
		Footlocker = function()
			AdminUtils.cmd(".gobject add 183266")
		end,

	},
	Buildings = {
		WhiteTent1 = function()
			AdminUtils.cmd(".gobject add 210286")
		end,
		WhiteTent2 = function()
			AdminUtils.cmd(".gobject add 190794")
		end,
		LargeTent = function()
			AdminUtils.cmd(".gobject add 184593")
		end,
		ColorfulTent = function()
			AdminUtils.cmd(".gobject add 188021")
		end,
		NightElfTent = function()
			AdminUtils.cmd(".gobject add 201388")
		end,
		DarkmoonFortuneTent = function()
			AdminUtils.cmd(".gobject add 180030")
		end,
		DarkmoonFoodTent = function()
			AdminUtils.cmd(".gobject add 180031")
		end,
		DarkmoonSouvenirTent = function()
			AdminUtils.cmd(".gobject add 180032")
		end,
		DarkmoonTicketTent = function()
			AdminUtils.cmd(".gobject add 180033")
		end,
		Necropolis = function()
			AdminUtils.cmd(".gobject add 181172")
		end,


		HordeTent = function()
			AdminUtils.cmd(".gobject add 201887")
		end,
		
		SenjinTent = function()
			AdminUtils.cmd(".gobject add 202886")
		end,
		SnowyTower = function()
			AdminUtils.cmd(".gobject add 190356")
		end,
		ShadowsightTower = function()
			AdminUtils.cmd(".gobject add 190356")
		end,
		NewAvalonMill = function()
			AdminUtils.cmd(".gobject add 191191")
		end,
		
		--WoD level 3 garrison buildings
		GardenHouse = function()
			AdminUtils.cmd(".gobject add 232286")
		end,
		Inn = function()
			AdminUtils.cmd(".gobject add 224807")
		end,
		Barracks = function()
			AdminUtils.cmd(".gobject add 224799")
		end,
		Armory = function()
			AdminUtils.cmd(".gobject add 224550")
		end,
		Barn = function()
			AdminUtils.cmd(".gobject add 224796")
		end,
		Stable = function()
			AdminUtils.cmd(".gobject add 225579")
		end,
		Mine = function()
			AdminUtils.cmd(".gobject add 225540")
		end,
		Engineering = function()
			AdminUtils.cmd(".gobject add 227595")
		end,
		Mill = function()
			AdminUtils.cmd(".gobject add 224812")
		end,
		Mill = function()
			AdminUtils.cmd(".gobject add 224812")
		end,
		TradingPost = function()
			AdminUtils.cmd(".gobject add 233189")
		end,
		SparringArena = function()
			AdminUtils.cmd(".gobject add 230479")
		end,		
	},
	Management = {
		LevelUp1 = function()
			AdminUtils.cmd(".levelup")
		end,
		LevelUp10 = function()
			AdminUtils.cmd(".levelup 10")
		end,
		LevelDown1 = function()
			AdminUtils.cmd(".levelup -1")
		end,
		LevelDown10 = function()
			AdminUtils.cmd(".levelup -10")
		end,
		AddTalentPoint = function()
			AdminUtils.cmd(".modify tp 3")
			AdminUtils.cmd(".modify talentpoints 3")
		end,
		
		KillCreature = function()
			AdminUtils.cmd(".die")
		end,
		RespawnCreature = function()
			AdminUtils.cmd(".respawn")
			AdminUtils.cmd(".revive")
		end,
		DeleteCreature = function()
			AdminUtils.cmd(".npc delete")
		end,
		NearObjects = function()
			AdminUtils.cmd(".gobject near 20")
		end,
		DeleteNearestObj = function()
			AdminUtils.deleteNearestObject = true
			AdminUtils.cmd(".gobject near 3")
		end,
		DeleteLastObj = function()
			if tonumber(lastObjectId) == 0 then
				return
			end
			AdminUtils.cmd(".gobject delete " .. lastObjectId)
			lastObjectId = 0
		end,
		HDCVars = function()
			-- Changing in game graphics settings overwrites these (some? all? dunno)
			-- I assume there is no need for a resetting function
			SetCVar("violencelevel", 5)
			SetCVar("farclip", 1600)
			SetCVar("groundeffectdensity", 256)
			SetCVar("groundeffectdist", 140)
			SetCVar("skycloudlod", 3)
			SetCVar("spelleffectlevel", 2)
		end,
		HDLiteCVars = function()
			SetCVar("farclip", 800)
			SetCVar("groundeffectdensity", 256)
			SetCVar("groundeffectdist", 140)
			SetCVar("skycloudlod", 3)
			SetCVar("spelleffectlevel", 2)
		end,
		Cloak = function() ShowCloak(not ShowingCloak()) end,
		Hat = function() ShowHelm(not ShowingHelm()) end,
		HideChat = function()
			_CHATHIDE=not _CHATHIDE 
			for i=1,NUM_CHAT_WINDOWS do 
				for _,v in pairs{"","Tab"}do
					local f=_G["ChatFrame"..i..v]
					if _CHATHIDE then
						f.v=f:IsVisible()
					end
					f.ORShow=f.ORShow or f.Show
					f.Show=_CHATHIDE and f.Hide or f.ORShow
					if f.v then
						f:Show()
					end
				end
			end

			-- classic wow
			if FriendsMicroButton ~= nil then FriendsMicroButton:Hide() end
			if ChatFrameMenuButton ~= nil then ChatFrameMenuButton:Hide() end
			
			-- modern
			if ChatFrameMenuButton ~= nil then ChatFrameMenuButton:Hide() end
			if QuickJoinToastButton ~= nil then QuickJoinToastButton:Hide() end
		end,
		MinimapToggle = function()
		
			if AdminUtils.IsClassicClient and toggleMiniMap then
				-- Calls a function I exposed in my copy of Hide_minimap addon
				toggleMiniMap()
			else
				print("This button works in wrath only, and only if you have the Hide_minimap addon")
			end
		end,				
		HDCVarsLegion = function()
			SetCVar('overridefarclip', 1)
			SetCVar('horizonfarclip', 6226)
			SetCVar('horizonStart', 24000)
			SetCVar('farclip', 24000)
			SetCVar('terrainLodDist', 2000)
			SetCVar('groundeffectdensity', 256)
			SetCVar('groundEffectDist', 500)
			SetCVar('groundEffectFade', 600)

			SetCVar('doodadLodDist', 2000)
			SetCVar('shadowMode', 3)
			SetCVar('shadowTextureSize', 2048)
			SetCVar('smallcull', 0)
			SetCVar('skycloudlod', 3)
			SetCVar('extshadowquality', 5)
			SetCVar('particleDensity', 100)
			SetCVar('particleMTDensity', 100)
			SetCVar('showfootprints', 1)

			SetCVar('showfootprintparticles', 1)
			SetCVar('environmentDetail', 150)
			SetCVar('terrainMipLevel', 0)
			SetCVar('worldBaseMip', 0)
			SetCVar('WeatherDensity', 3)
			SetCVar('detailDoodadAlpha', 100)
			SetCVar('characterAmbient', 1)

			SetCVar('ffxGlow', 1)
			SetCVar('ffxDeath', 1)
			SetCVar('reflectionMode', 3)
			SetCVar('rippleDetail', 3)
			SetCVar('sunshafts', 2)
			SetCVar('spellEffectLevel', 62)

			SetCVar('componentTextureLevel', 0)
			SetCVar('componentSpecular', 1)
			SetCVar('compenentEmissive', 1)
			SetCVar('lodObjectMinSize', 1000)
			SetCVar('lodObjectCullSize', 100)
			SetCVar('lodObjectCullDist', 200)
			SetCVar('lodObjectFadeScale', 300)
			SetCVar('SSAODistance', 750)
		end,
		DropOne = function()
			SetAbandonQuest()
			AbandonQuest()
		end,
		DropAll = function()
			for i=1,GetNumQuestLogEntries() do 
				SelectQuestLogEntry(i)
				SetAbandonQuest()
				AbandonQuest()
			end
		end,
		QuestComplete = function()
			local questID = AdminUtils.GetSelectedQuestID() or AdminUtils.latestQuestID
			if questID then
				AdminUtils.cmd(".quest complete " .. questID)
				print("Completing questID: " .. questID)
			else
				print("No quest selected.")
			end
		end,
	},
	Addons = {
		Baggins = function()
			if IsAddOnLoaded("Baggins") then
				AdminUtils:VarDump(Baggins)
			else
				print("Baggins addon is not loaded.")
			end
		end,
		Bartender = function()
		
		end,
		mobinfo = function()
		
		end,
		atlas = function()
		
		end,
	},
}


function AdminUtils.IsClassicClient()
    local version = GetBuildInfo()
    local majorVersion, minorVersion = strsplit(".", version)
    majorVersion, minorVersion = tonumber(majorVersion), tonumber(minorVersion)

    return (majorVersion < 4) or (majorVersion == 4 and minorVersion <= 3)
end


AdminUtils.adminToolsBindings = {
	{ key = AdminUtils.IsClassicClient() and "F1" or "F1", name = "ADMINTOOLS_1_BINDING" },
	{ key = AdminUtils.IsClassicClient() and "F2" or "F2", name = "ADMINTOOLS_2_BINDING" },
	{ key = AdminUtils.IsClassicClient() and "F3" or "F3", name = "ADMINTOOLS_3_BINDING" },
	{ key = AdminUtils.IsClassicClient() and "F4" or "F4", name = "ADMINTOOLS_4_BINDING" },
	{ key = AdminUtils.IsClassicClient() and "F5" or "F5", name = "ADMINTOOLS_5_BINDING" },
	{ key = AdminUtils.IsClassicClient() and "F6" or "F6", name = "ADMINTOOLS_6_BINDING" },
	{ key = AdminUtils.IsClassicClient() and "F7" or "F7", name = "ADMINTOOLS_7_BINDING" },
	{ key = AdminUtils.IsClassicClient() and "F8" or "F8", name = "ADMINTOOLS_8_BINDING" },
	{ key = AdminUtils.IsClassicClient() and "F9" or "F9", name = "ADMINTOOLS_9_BINDING" },
	{ key = AdminUtils.IsClassicClient() and "F10" or "F10", name = "ADMINTOOLS_10_BINDING" },
	{ key = AdminUtils.IsClassicClient() and "F11" or "F11", name = "ADMINTOOLS_11_BINDING" },
	{ key = AdminUtils.IsClassicClient() and "F12" or "F12", name = "ADMINTOOLS_12_BINDING" },
	{ key = AdminUtils.IsClassicClient() and "F13" or "F13", name = "ADMINTOOLS_13_BINDING" },
	{ key = AdminUtils.IsClassicClient() and "F14" or "F14", name = "ADMINTOOLS_14_BINDING" },
	{ key = AdminUtils.IsClassicClient() and "F15" or "F15", name = "ADMINTOOLS_15_BINDING" },
	{ key = AdminUtils.IsClassicClient() and "F16" or "F16", name = "ADMINTOOLS_16_BINDING" },
	{ key = AdminUtils.IsClassicClient() and "F17" or "F17", name = "ADMINTOOLS_17_BINDING" },
	{ key = AdminUtils.IsClassicClient() and "F18" or "F18", name = "ADMINTOOLS_18_BINDING" },
	{ key = AdminUtils.IsClassicClient() and "F19" or "F19", name = "ADMINTOOLS_19_BINDING" },
	{ key = AdminUtils.IsClassicClient() and "F20" or "F20", name = "ADMINTOOLS_20_BINDING" },
	{ key = AdminUtils.IsClassicClient() and "F21" or "F21", name = "ADMINTOOLS_21_BINDING" },
	{ key = AdminUtils.IsClassicClient() and "F22" or "F22", name = "ADMINTOOLS_22_BINDING" },
	{ key = AdminUtils.IsClassicClient() and "F23" or "F23", name = "ADMINTOOLS_23_BINDING" },
	{ key = AdminUtils.IsClassicClient() and "F24" or "F24", name = "ADMINTOOLS_24_BINDING" },
}

-- Localized Keybinding Names
BINDING_HEADER_ADMINTOOLS = "Admin Tools";
BINDING_CATEGORY_ADMINTOOLS = "Admin Tools";
BINDING_NAME_ADMINTOOLS_1_BINDING = "Action 1";
BINDING_NAME_ADMINTOOLS_2_BINDING = "Action 2";
BINDING_NAME_ADMINTOOLS_3_BINDING = "Action 3";
BINDING_NAME_ADMINTOOLS_4_BINDING = "Action 4";
BINDING_NAME_ADMINTOOLS_5_BINDING = "Action 5";
BINDING_NAME_ADMINTOOLS_6_BINDING = "Action 6";
BINDING_NAME_ADMINTOOLS_7_BINDING = "Action 7";
BINDING_NAME_ADMINTOOLS_8_BINDING = "Action 8";
BINDING_NAME_ADMINTOOLS_9_BINDING = "Action 9";
BINDING_NAME_ADMINTOOLS_10_BINDING = "Action 10";
BINDING_NAME_ADMINTOOLS_11_BINDING = "Action 11";
BINDING_NAME_ADMINTOOLS_12_BINDING = "Action 12";
BINDING_NAME_ADMINTOOLS_13_BINDING = "Action 13";
BINDING_NAME_ADMINTOOLS_14_BINDING = "Action 14";
BINDING_NAME_ADMINTOOLS_15_BINDING = "Action 15";
BINDING_NAME_ADMINTOOLS_16_BINDING = "Action 16";
BINDING_NAME_ADMINTOOLS_17_BINDING = "Action 17";
BINDING_NAME_ADMINTOOLS_18_BINDING = "Action 18";
BINDING_NAME_ADMINTOOLS_19_BINDING = "Action 19";
BINDING_NAME_ADMINTOOLS_20_BINDING = "Action 20";
BINDING_NAME_ADMINTOOLS_21_BINDING = "Action 21";
BINDING_NAME_ADMINTOOLS_22_BINDING = "Action 22";
BINDING_NAME_ADMINTOOLS_23_BINDING = "Action 23";
BINDING_NAME_ADMINTOOLS_24_BINDING = "Action 24";

BINDING_NAME_ADMINTOOLS_1 = "Action 1";
BINDING_NAME_ADMINTOOLS_2 = "Action 2";
BINDING_NAME_ADMINTOOLS_3 = "Action 3";
BINDING_NAME_ADMINTOOLS_4 = "Action 4";
BINDING_NAME_ADMINTOOLS_5 = "Action 5";
BINDING_NAME_ADMINTOOLS_6 = "Action 6";
BINDING_NAME_ADMINTOOLS_7 = "Action 7";
BINDING_NAME_ADMINTOOLS_8 = "Action 8";
BINDING_NAME_ADMINTOOLS_9 = "Action 9";
BINDING_NAME_ADMINTOOLS_10 = "Action 10";
BINDING_NAME_ADMINTOOLS_11 = "Action 11";
BINDING_NAME_ADMINTOOLS_12 = "Action 12"

local waitTable = {};
local waitFrame = nil;

AdminUtils.deleteNearestObject = false
AdminUtils.lastObjectId = 0
AdminUtils.CONTENT_ROW_SPACE = 12
AdminUtils.BUTTONS_PER_ROW = 4
AdminUtils.ACTION_ICON_SIZE = 36
AdminUtils.CONTENT_ICON_SIZE = 36

AdminUtils.GROUPS_IN_COLUMN = {}

----------------------------------------------------------------start functions
local function ButtonPanel(name, width, height)
	-- reset the counters for each panel
	AdminUtils.GROUPS_IN_COLUMN = {}

	local f = CreateFrame("Frame", name, UIParent)
	tinsert(UISpecialFrames, f:GetName())
	f:SetSize(width, height)
	f:SetPoint("CENTER")
	
	f:SetBackdrop({
		bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
		edgeFile = "Interface\\ChatFrame\\ChatFrameBackground",
		edgeSize = 1,
	})
	f:SetBackdropColor(0, 0, 0, .5)
	f:SetBackdropBorderColor(0, 0, 0)

	f:SetFrameStrata("FULLSCREEN_DIALOG")
	f:EnableMouse(true)
	f:SetMovable(true)
	f:RegisterForDrag("LeftButton")
	f:SetScript("OnDragStart", f.StartMoving)
	f:SetScript("OnDragStop", f.StopMovingOrSizing)
	f:SetScript("OnHide", f.StopMovingOrSizing)

	local close = CreateFrame("Button", nil, f, "UIPanelCloseButton")
	f.closeButton = close
	close:SetPoint("TOPRIGHT", f, "TOPRIGHT")
	close:SetScript("OnClick", function()
		f:Hide()
	end)
	-- Enable keyboard input for this frame
	f:EnableKeyboard(true)

	f:SetScript("OnKeyDown", function(self, key)
		if key == "ESCAPE" then
			f:Hide()
		end
	end)
	
	return f
end

local function ActionsMenu()
	-- mrgrglglglglglglglglr
	PlaySound(416)
	local f = ButtonPanel("ActionsFrame", 960, 405)
	
	AdminUtils.MakeButtonColumn(f, "Action", AdminUtils.buttons.Action,         1)
	AdminUtils.MakeButtonColumn(f, "Pet", AdminUtils.buttons.Pet,               1, 6)	
	AdminUtils.MakeButtonColumn(f, "Summon", AdminUtils.buttons.Summon,         1, 8)
	
	AdminUtils.MakeButtonColumn(f, "Action", AdminUtils.buttons.Action2,        2)
	AdminUtils.MakeButtonColumn(f, "NPCBot", AdminUtils.buttons.NPCBot,         2, 7)	

	AdminUtils.MakeButtonColumn(f, "Crafting", AdminUtils.buttons.Crafting,     3)
	AdminUtils.MakeButtonColumn(f, "Weather", AdminUtils.buttons.Weather,       3, 5)
	AdminUtils.MakeButtonColumn(f, "PlayerBot", AdminUtils.buttons.PlayerBot,   3, 7)
	
	AdminUtils.MakeButtonColumn(f, "Tele", AdminUtils.buttons.TeleHome,         4)
	AdminUtils.MakeButtonColumn(f, "Tele", AdminUtils.buttons.TeleCamp,         4, 3)
	AdminUtils.MakeButtonColumn(f, "Tele", AdminUtils.buttons.TeleShared,       4, 5)
	AdminUtils.MakeButtonColumn(f, "Tele", AdminUtils.buttons.TeleOther,        4, 7)	
	
	AdminUtils.MakeButtonColumn(f, "Tele", AdminUtils.buttons.TeleHomeSet,      5)
	AdminUtils.MakeButtonColumn(f, "Tele", AdminUtils.buttons.TeleCampSet,      5, 3)
	AdminUtils.MakeButtonColumn(f, "Tele", AdminUtils.buttons.TeleSharedSet,    5, 5)

	AdminUtils.MakeButtonColumn(f, "Tele", AdminUtils.buttons.Tele,             6)
	AdminUtils.MakeButtonColumn(f, "Management", AdminUtils.buttons.Management, 6, 6)



	--AdminUtils.MakeButtonColumn(f, "Addons", AdminUtils.buttons.Addons,         2, 6)
end

local function ContentMenu()
	local f = ButtonPanel("ContentToolsFrame", 962, 495)
	
	AdminUtils.MakeButtonColumn(f, "NPC", AdminUtils.buttons.NPC,               1)
	AdminUtils.MakeButtonColumn(f, "ShopInv", AdminUtils.buttons.ShopInv,       1, 9)

	AdminUtils.MakeButtonColumn(f, "Minerals", AdminUtils.buttons.Minerals,     2)
	AdminUtils.MakeButtonColumn(f, "Buildings", AdminUtils.buttons.Buildings,   2, 5)

	AdminUtils.MakeButtonColumn(f, "Herbs", AdminUtils.buttons.Herbs,           3)

	AdminUtils.MakeButtonColumn(f, "Camp", AdminUtils.buttons.Camp1,            4)
	
	--AdminUtils.MakeButtonColumn(f, "Management", AdminUtils.buttons.Management, 4, 11)
	
	AdminUtils.MakeButtonColumn(f, "Camp", AdminUtils.buttons.Camp2,            5)
	
	AdminUtils.MakeButtonColumn(f, "Camp", AdminUtils.buttons.Camp3,            6)
end

local function ContentMenu2()
	local f = ButtonPanel("ContentToolsFrame2", 1140, 550)
	--content menu 2 buttons
	
end

local function ConfigMenu()
	local f = ButtonPanel("ContentToolsFrame", 1140, 550)
	
	-- display whether user is playing on cmangos, acore, legion or unknown

	-- things to configure: 
	--	Contents of:
	--		AddGear/Spells/Talents for Wrath/LegionHeirloomUpgradeTokens
	--	Button categories being displayed in actions and content panels.
	--		herbs, minerals, npcs, camp objects, buildings, furniture, bot commands, teleports, buffs, summons
	--  Data entry to add new button categories
	--	Textarea containing all the custom object IDs found in the vicinity, to export with sql tool
	--	Number of home/camp waypoints, and whether they should be acct or character specific
	--	ReloadUI button
	--	Whether to automatically apply my preferred settings for other addons, and the game client. 
	--		Never need to worry about steam deck settings synch again!
	--		Baggins categories
	--		SilverDragon, Talented, Elvui default profiles
	--		Disable most elvui settings
	--		Legion: configure dejacharacterstats
	
	AdminUtils.VarDump(AdminToolsDB.profiles[AdminToolsDB.activeProfile])
end

function AdminUtils.RunBinding(binding, target)
	print("Running binding " .. binding)
	if binding == "ADMINTOOLS_1_BINDING" then
		target:GetParent().secureButtons[1]:Click()
	elseif binding == "ADMINTOOLS_2_BINDING" then
		target:GetParent().secureButtons[2]:Click()
	elseif binding == "ADMINTOOLS_3_BINDING" then
		target:GetParent().secureButtons[3]:Click()
	elseif binding == "ADMINTOOLS_4_BINDING" then
		target:GetParent().secureButtons[4]:Click()
	elseif binding == "ADMINTOOLS_5_BINDING" then
		target:GetParent().secureButtons[5]:Click()
	elseif binding == "ADMINTOOLS_6_BINDING" then
		target:GetParent().secureButtons[6]:Click()
	elseif binding == "ADMINTOOLS_7_BINDING" then
		target:GetParent().secureButtons[7]:Click()
	elseif binding == "ADMINTOOLS_8_BINDING" then
		target:GetParent().secureButtons[8]:Click()
	elseif binding == "ADMINTOOLS_9_BINDING" then
		target:GetParent().secureButtons[9]:Click()
	elseif binding == "ADMINTOOLS_10_BINDING" then
		target:GetParent().secureButtons[10]:Click()
	elseif binding == "ADMINTOOLS_11_BINDING" then
		target:GetParent().secureButtons[11]:Click()
	elseif binding == "ADMINTOOLS_12_BINDING" then
		target:GetParent().secureButtons[12]:Click()
	elseif binding == "ADMINTOOLS_13_BINDING" then
		target:GetParent().secureButtons[13]:Click()
	elseif binding == "ADMINTOOLS_14_BINDING" then
		target:GetParent().secureButtons[14]:Click()
	elseif binding == "ADMINTOOLS_15_BINDING" then
		target:GetParent().secureButtons[15]:Click()
	elseif binding == "ADMINTOOLS_16_BINDING" then
		target:GetParent().secureButtons[16]:Click()
	elseif binding == "ADMINTOOLS_17_BINDING" then
		target:GetParent().secureButtons[17]:Click()
	elseif binding == "ADMINTOOLS_18_BINDING" then
		target:GetParent().secureButtons[18]:Click()
	elseif binding == "ADMINTOOLS_19_BINDING" then
		target:GetParent().secureButtons[19]:Click()
	elseif binding == "ADMINTOOLS_20_BINDING" then
		target:GetParent().secureButtons[20]:Click()
	elseif binding == "ADMINTOOLS_21_BINDING" then
		target:GetParent().secureButtons[21]:Click()
	elseif binding == "ADMINTOOLS_22_BINDING" then
		target:GetParent().secureButtons[22]:Click()
	elseif binding == "ADMINTOOLS_23_BINDING" then
		target:GetParent().secureButtons[23]:Click()
	elseif binding == "ADMINTOOLS_24_BINDING" then
		target:GetParent().secureButtons[24]:Click()
	end
end

function AdminUtils.AddVendorItems(items)
	for idx = 1, #items do
		AdminUtils.cmd(".npc additem " .. items[idx])
		AdminUtils.cmd(".npc add item " .. items[idx])
		--AdminUtils.cmd(".npc delitem " .. items[idx])
		--AdminUtils.cmd(".npc del item " .. items[idx])
	end
end

function AdminUtils.delayedRun(delay, func, ...)
	if(type(delay)~="number" or type(func)~="function") then
		return false;
	end
	if(waitFrame == nil) then
		waitFrame = CreateFrame("Frame","WaitFrame", UIParent);
		waitFrame:SetScript("onUpdate",function (self,elapse)
			local count = #waitTable;
			local i = 1;
			while(i<=count) do
				local waitRecord = tremove(waitTable,i);
				local d = tremove(waitRecord,1);
				local f = tremove(waitRecord,1);
				local p = tremove(waitRecord,1);
				if(d>elapse) then
					tinsert(waitTable,i,{d-elapse,f,p});
					i = i + 1;
				else
					count = count - 1;
					f(unpack(p));
				end
			end
		end);
	end
	tinsert(waitTable,{delay,func,{...}});
	return true;
end

local function PrintKeyBindingsForActions(actions)
	for _, action in ipairs(actions) do
		local key1, key2 = GetBindingKey(action)
		if key1 == nil then key1 = "nil" end
		if key2 == nil then key2 = "nil" end
		print("Keybindings for action " .. action .. ": " .. key1 .. ", " .. key2)
	end
end

function AdminUtils.cmd(command)
	SendChatMessage(command, "SAY")
end

function AdminUtils.pcmd(command)
	SendChatMessage(command, "PARTY")
end

function AdminUtils.wcmd(command)
	--SendChatMessage(command, "WHISPER", GetDefaultLanguage(), target??)
end

local function DumpObjectString(tbl, indent)
	if not indent then indent = 0 end
	local str = ""
	
	if tbl == nil then return "nil" end
	
	if type(tbl) ~= "table" then
		return "" .. tbl .. ""
	end
		

	for k, v in pairs(tbl) do
		formatting = string.rep("  ", indent) .. k .. ": "
		if type(v) == "table" then
			str = str .. formatting .. "\n" .. DumpObjectString(v, indent + 1)
		else
			str = str .. formatting .. tostring(v) .. "\n"
		end
	end

	return str
end

function AdminUtils.VarDump(table, varName)
	if varName == nil then varName = "" end
	print(varName .. ": " .. DumpObjectString(table))
end

local function TeleButtonHandler(f, btn)
	f:Hide()
	-- The dashes being added to the commands here ensure that partial
	-- tele name matches do not occur
	local player = AdminUtils.playerName
	if (string.lower(btn) == "waypointset") then
		AdminUtils.cmd("tele del -" .. player .. "-Waypoint")
		AdminUtils.cmd("tele add -" .. player .. "-Waypoint")

		AdminUtils.cmd(".tele del -" .. player .. "-Waypoint")
		AdminUtils.cmd(".tele add -" .. player .. "-Waypoint")
		return
	end
	if (string.lower(btn) ~= "return") then
		AdminUtils.cmd("tele del -" .. player .. "-Return")
		AdminUtils.cmd("tele add -" .. player .. "-Return")
		
		AdminUtils.cmd(".tele del -" .. player .. "-Return")
		AdminUtils.cmd(".tele add -" .. player .. "-Return")
	end
	if (string.lower(btn) == "waypoint") then
		AdminUtils.cmd("tele -" .. player .. "-Waypoint")
		AdminUtils.cmd(".tele -" .. player .. "-Waypoint")
		return
	end

	if (string.lower(btn) == "return") then
		AdminUtils.cmd("tele -" .. player .. "-" .. btn)
		AdminUtils.cmd(".tele -" .. player .. "-" .. btn)
		return
	end

	suffix = string.sub(btn, string.len(btn) - 2)
	tele_type = string.lower(string.sub(btn, 0, 4))
	
	if suffix == "Set" then
		location = string.sub(btn, 0, string.len(btn) - 3)
		if type_type == "camp" or tele_type == "home" then
			location = "-" .. player .. "-" .. location
		end
		AdminUtils.cmd("tele del " .. location)
		AdminUtils.cmd("tele add " .. location)
		AdminUtils.cmd(".tele del " .. location)
		AdminUtils.cmd(".tele add " .. location)
		return
	end

	if tele_type == "camp" or tele_type == "home" then
		btn = "-" .. player .. "-" .. btn
	end
	AdminUtils.cmd("tele " .. btn)
	AdminUtils.cmd(".tele " .. btn)
end

function AdminUtils.MakeButtonColumn(actionPanel, buttonsCategory, buttons, column, startingRow)
	if startingRow == nil then startingRow = 1 end	
	if buttons == nil then error("MakeButtonColumn(buttons) is nil") end
	if AdminUtils.GROUPS_IN_COLUMN[column] == nil then
		AdminUtils.GROUPS_IN_COLUMN[column] = 1
	else
		AdminUtils.GROUPS_IN_COLUMN[column] = AdminUtils.GROUPS_IN_COLUMN[column] + 1
	end

	local s = AdminUtils.CONTENT_ICON_SIZE
	local rowWidth = s * AdminUtils.BUTTONS_PER_ROW + AdminUtils.CONTENT_ROW_SPACE
	local vOffset = -5 - (startingRow * s) + s
	local hOffset = 5 + (rowWidth * column) - rowWidth

	-- spacing for headers
	if startingRow > 1 then
		vOffset = vOffset - (14 * (AdminUtils.GROUPS_IN_COLUMN[column] - 1))
	end

	local startHOffset = hOffset
	local innerColumnCount = 1
	
	for idx = 1, #buttons do
		local btn = buttons[idx]
		if btn == nil then
			AdminUtils.VarDump(innerColumnCount, "innerColumnCount")
			AdminUtils.VarDump(idx, "idx")
			AdminUtils.VarDump(buttons, "buttons")
			return
		end
		
		AdminUtils.MakeButton(btn, actionPanel, buttonsCategory, hOffset, vOffset)
		if innerColumnCount < AdminUtils.BUTTONS_PER_ROW then
			hOffset = hOffset + AdminUtils.CONTENT_ICON_SIZE
			innerColumnCount = innerColumnCount + 1
		else
			hOffset = startHOffset
			vOffset = vOffset - AdminUtils.CONTENT_ICON_SIZE
			innerColumnCount = 1
		end
	end
end

function AdminUtils.MakeButton(button, formParent, buttonsCategory, hOffset, vOffset)
	local icon = nil
	local tooltipText = nil
	
	if button == nil then
		error("How is MakeButton() being called with a nil button?")
	end
	
	if type(button) == "table" then
		icon = button[2]		
		button = button[1]
		tooltipText = button[3]
	end
	
	local function CraftingHandler(formParent, button)
		formParent:Hide()
		CastSpellByName(button)
	end
	
	
	local btn = CreateFrame("Button", "AdminActionButton" .. button, formParent)
	btn:SetPoint("TOPLEFT", formParent, hOffset, vOffset)
	btn:SetSize(AdminUtils.CONTENT_ICON_SIZE, AdminUtils.CONTENT_ICON_SIZE)
	btn:SetScript("OnClick", function()
		local handler = nil
		if buttonsCategory == "Tele" or buttonsCategory == "TeleSet" then
			handler = TeleButtonHandler
		elseif buttonsCategory == "Crafting" then	
			handler = CraftingHandler
		else
			handler = AdminUtils.buttonFunction(formParent, buttonsCategory, button)
		end
		handler(formParent, button)
	end)

	btn:SetScript("OnEnter", function(self)
		local txt = tooltipText and tooltipText or button
		GameTooltip:SetOwner(self, "ANCHOR_TOP")
		GameTooltip:SetPoint("BOTTOM", self, "TOP", 0, 5)
		GameTooltip:SetText(txt, 1, 1, 1)
		GameTooltip:Show()
	end)

	btn:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	-- Set the button's texture (icon)
	if icon ~= nil then
		local texture = btn:CreateTexture()
		texture:SetAllPoints()
		texture:SetTexture("Interface\\Icons\\" .. icon) -- Replace with the path to the icon you want to use
		btn.texture = texture
	end
end

function AdminUtils.SetupSettingsDB()
	--AdminToolsDB.activeProfile = "default"
	local defaultConfig = {
		profiles = {
			default = {
				auto_talents_wrath = {},
			},
		},
		activeProfile = "default",
	}

	local configFrame = CreateFrame("Frame")

	local function configEventHandler(self, event, addonName)
		if event == "ADDON_LOADED" and addonName == "AdminTools" then
			-- Set up character-specific SavedVariable with default settings
			if not AdminToolsDB then
				AdminToolsDB = {}
			end
			for k, v in pairs(defaultConfig) do
				if AdminToolsDB[k] == nil then
					AdminToolsDB[k] = v
				end
			end
		end
	end

	configFrame:SetScript("OnEvent", configEventHandler)
	configFrame:RegisterEvent("ADDON_LOADED")
end

-- Return a callable function from the buttonFunctionsTable
function AdminUtils.buttonFunction(f, buttonType, buttonName)
	if f ~= nil then 
		f:Hide() 
	end
	return AdminUtils.buttonFunctions[buttonType][buttonName]
end

-- Automatically add talents each time player logs in. acore doesn't need this
-- but cmangos does because it deletes invalid talents (or doesn't save them)
local function AutorunAddTalents()

	local serverInfoFrame = CreateFrame("Frame")
	local serverInfoDetected = false
	local version = GetBuildInfo()
	AdminUtils.gameVersion = version
	
	local function processServerInfo(msg)
		if string.find(msg, "CMaNGOS") then
			print("AdminTools: Detected CMaNGOS")
			if version == "3.3.5" then
				AdminUtils.buttonFunctions.Action.TalentsWrath()
			end

			serverInfoFrame:UnregisterEvent("CHAT_MSG_SYSTEM")
			serverInfoDetected = true
		elseif string.find(msg, "AzerothCore") then
			print("AdminTools: Detected AzerothCore")
			serverInfoFrame:UnregisterEvent("CHAT_MSG_SYSTEM")
			serverInfoDetected = true

		elseif string.find(msg, "PraeviusCore") then
			print("AdminTools: Detected PraeviusCore")
			serverInfoFrame:UnregisterEvent("CHAT_MSG_SYSTEM")
			serverInfoDetected = true
		end
	end

	local function serverInfoEventHandler(self, event, msg)
		if event == "CHAT_MSG_SYSTEM" then
			processServerInfo(msg)
		end
	end

	local function requestServerInfo()
		SendChatMessage(".server info", "say")
		serverInfoFrame:SetScript("OnEvent", serverInfoEventHandler)
		serverInfoFrame:RegisterEvent("CHAT_MSG_SYSTEM")
	end

	-- Request server information
	AdminUtils.delayedRun(2, function() requestServerInfo() end)

	-- If the server information is not detected in a reasonable time, unregister the event
	AdminUtils.delayedRun(4, function()
		if not serverInfoDetected then
			print("Server information could not be detected")
			serverInfoFrame:UnregisterEvent("CHAT_MSG_SYSTEM")
		end
	end)
end

-- Listen for object creation messages from mangos and save the object ID
local function DeleteLastObjectIfFlagged()
	local f = CreateFrame("Frame")
	f:RegisterEvent("CHAT_MSG_SYSTEM")
	f:SetScript("OnEvent", function(self, event, message, sender, ...)
		-- Allow deleting of the most recently added object
		if string.find(message, "Add Game Object") then
			local idStart = string.find(message, "GUID: ") + 6
			local idEnd = string.find(message, " ", idStart) - 2
			lastObjectId = string.sub(message, idStart, idEnd)
			AdminUtils.cmd("last object guid " .. lastObjectId)
		end
		
		local function TakeFirstObjectID(message)
			--in azerothcore and ashamanecore (legion), the object near output will
			--place the ID after the first space
			
			--in cmangos, it is at the very beginning of the string, until the first 
			--comma
			
			local endId = string.find(message, " ")
			endId = string.sub(message, 0, endId - 1)
			endId = string.gsub(endId, ",", "")
			endId = string.gsub(endId, " ", "")
			endId = tonumber(endId)
			if endId == nil then return 0 end
			return endId
		end

		-- if flag has been set, delete the nearest object
		if AdminUtils.deleteNearestObject == true then
			endId = TakeFirstObjectID(message)
			print("endID: [" .. endId .. "]")
			
			-- this should prevent deleting any non-user created objects
			if endId < 100000 or endId == 0 then
				return
			end
			AdminUtils.cmd(".gobject delete " .. tostring(endId))
			print("gobject: " .. tostring(endId) .. " has been deleted")
			AdminUtils.deleteNearestObject = false
		end
	end)
end

-- Build a button overlay which fades when moused-out. It's supposed to 
-- automatically take the bindings for F1-F12 so that some binds that are
-- constant between many characters are always present without needing to
-- be configured, but that part isn't working.
local overlayCreated = false
local function BuildOverlay()
	local function isMouseOverAnyButton(buttons)
		for _, button in ipairs(buttons) do
			if button:IsMouseOver() then
				return true
			end
		end
		return false
	end

	local function CreateButton(parent, width, height, text, onClick)
		local button = CreateFrame("Button", nil, parent, "UIPanelButtonTemplate")
		button:SetWidth(width)
		button:SetHeight(height)
		button:SetText(text)
		button:SetScript("OnClick", onClick)
		return button
	end

	local function FadeOutFrame(frame, duration)
		frame.fadeInfo = {
			mode = "OUT",
			timeToFade = duration,
		}
		UIFrameFade(frame, frame.fadeInfo)
	end

	local function CreateOverlay()
		if overlayCreated then return nil end
		
		local overlay = CreateFrame("Frame", "AdminToolsOverlay", UIParent)
		overlay:SetSize(246, 166)
		overlay:SetPoint("CENTER", 330, -85)
		overlay:SetBackdrop({
			bgFile = "Interface/Tooltips/UI-Tooltip-Background",
			edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
			tile = true, tileSize = 16, edgeSize = 16,
			insets = { left = 4, right = 4, top = 4, bottom = 4 }
		})
		overlay:SetBackdropColor(0, 0, 0, 0.8)
		overlay:SetBackdropBorderColor(0.8, 0.8, 0.8, 0.8)
		overlay:EnableMouse(true)
		if AdminUtils.IsClassicClient() then
			overlay:EnableKeyboard(true)
		else
			overlay:EnableKeyboard(false)
			overlay:SetPropagateKeyboardInput(true)
		end
		overlay:SetMovable(true)
		overlay:RegisterForDrag("LeftButton")
		overlay:SetScript("OnDragStart", overlay.StartMoving)
		overlay:SetScript("OnDragStop", overlay.StopMovingOrSizing)
		
		function GetBindingFromClick(key)
			if AdminUtils.IsClassicClient() then
				local keyID = GetBindingKey("CLICK " .. key .. ":LeftButton")
				if keyID then
					return "CLICK " .. key .. ":LeftButton"
				end
			else
				for _, binding in ipairs(AdminUtils.adminToolsBindings) do
					local bindingKey = GetBindingKey(binding.name)
					if bindingKey == key then
						return binding.name
					end
				end
			end
			return nil
		end

		overlay:SetAlpha(0)
		overlayCreated = true
		return overlay
	end

	local function OverlayButton(name, hOffset, vOffset, overlay, tooltipText, iconPath, customFunc, buttonBind)
		function SetButtonKeybinding(name, key, macro)
			if AdminUtils.IsClassicClient() then
				SetBindingClick(key, macro)
			else
				SetBinding(key, name)
			end
		end

		-- Create the button
		local iconButton = CreateFrame("Button", name, overlay)
		iconButton:SetSize(AdminUtils.ACTION_ICON_SIZE, AdminUtils.ACTION_ICON_SIZE)
		iconButton:SetPoint("TOPLEFT", hOffset, vOffset)

		-- Set the button's texture (icon)
		local texture = iconButton:CreateTexture()
		texture:SetAllPoints()
		texture:SetTexture("Interface\\Icons\\" .. iconPath) -- Replace with the path to the icon you want to use
		iconButton.texture = texture

		iconButton:SetScript("OnEnter", function(self)
			GameTooltip:SetOwner(self, "ANCHOR_TOP")
			GameTooltip:SetPoint("BOTTOM", self, "TOP", 0, 5)
			GameTooltip:SetText(tooltipText, 1, 1, 1)
			GameTooltip:Show()
			UIFrameFadeRemoveFrame(overlay)
			overlay:SetAlpha(1)
		end)
		
		iconButton:SetScript("OnLeave", function(self)
			GameTooltip:Hide()
			FadeOutFrame(overlay, 3)
		end)
		
		if customFunc == nil then
			error("Why is customFunc nil? button: " .. name)
		end
		
		iconButton:SetScript("OnClick", function(self)
			customFunc()
		end)

		-- Create a secure action button
		local secureActionButton = CreateFrame("Button", name .. "Secure", overlay, "SecureActionButtonTemplate")
		secureActionButton:SetAttribute("type", "macro")
		secureActionButton:SetAttribute("macrotext", "/click " .. name)
		secureActionButton:Hide()

		-- Set keybinding for the button
		if buttonBind ~= nil then
			local bindName = name
			SetButtonKeybinding(bindName, buttonBind, "MACRO " .. bindName .. "Secure")
		end
	end
	

	local overlay = CreateOverlay()

	-- Row 1
	OverlayButton("ADMINTOOLS_1",  5, -5, overlay, "Open AdminTools Content Panel", 	
		"Ability_rogue_tricksofthetrade",
		ContentMenu, 
		"F1"
	)
	OverlayButton("ADMINTOOLS_2", 45, -5, overlay, "Open AdminTools Actions Panel", 
		"Ability_rogue_tricksofthetrade",
		ActionsMenu,
		"F2"
	)

	OverlayButton("ADMINTOOLS_3", 85, -5, overlay, "Respawn targeted dead creature", 
		"Spell_shaman_blessingofeternals",
		AdminUtils.buttonFunction(nil, "Management", "RespawnCreature"),
		"F3"
	)
	OverlayButton("ADMINTOOLS_4", 125, -5, overlay, "Rain", 
		"Spell_frost_summonwaterelemental",
		AdminUtils.buttonFunction(nil, "Weather", "LightRain"), 
		"F4"
	)

--	OverlayButton("ADMINTOOLS_3",  85, -5, overlay, "Open AdminTools Content Panel 2", 
--		"Ability_rogue_tricksofthetrade",
--		ContentMenu2, 
--		"F3"
--	)
--	OverlayButton("ADMINTOOLS_4", 125, -5, overlay, "Open AdminTools Config Panel", 
--		"Inv_misc_wrench_01",
--		ConfigMenu, 
--		"F4"
--	)
	OverlayButton("ADMINTOOLS_5", 165, -5, overlay, "Enable GM mode and flying", 
		"Ability_vanish",
		AdminUtils.buttonFunction(nil, "Action", "Fly"), 
		"F5"
	)
	OverlayButton("ADMINTOOLS_6", 205, -5, overlay, "Disable GM mode and flying", 
		"Ability_vanish",
		AdminUtils.buttonFunction(nil, "Action", "Land"), 
		"F6"
	)

	-- Row 2
	OverlayButton("ADMINTOOLS_7", 5, -45, overlay, "Walk slowly, barely moving at all", 
		"Ability_rogue_sprint",
		AdminUtils.buttonFunction(nil, "Action", "SlowWalk"), 
		"F7"
	)
	OverlayButton("ADMINTOOLS_8", 45, -45, overlay, "Walk normally", 
		"Ability_rogue_sprint",
		AdminUtils.buttonFunction(nil, "Action", "Walk"), 
		"F8"
	)
	OverlayButton("ADMINTOOLS_9", 85, -45, overlay, "Powerwalk", 
		"Ability_rogue_sprint",
		AdminUtils.buttonFunction(nil, "Action", "FastWalk"), 
		"F9"
	)
	OverlayButton("ADMINTOOLS_10", 125, -45, overlay, "Jog", 
		"Ability_rogue_sprint",
		AdminUtils.buttonFunction(nil, "Action", "Jog"), 
		"F10"
	)
	OverlayButton("ADMINTOOLS_11", 165, -45, overlay, "Dash", 
		"Spell_fire_burningspeed",
		AdminUtils.buttonFunction(nil, "Action", "Dash"), 
		"F11"
	)
	OverlayButton("ADMINTOOLS_12", 205, -45, overlay, "Toggle Stealth", 
		"Ability_stealth",
		AdminUtils.buttonFunction(nil, "Action", "Stealth"), 
		"F12"
	)
	
	-- Row 3
	OverlayButton("ADMINTOOLS_13",  5, -85, overlay, "Tell both PlayerBots and NPCBots to attack your target", 	
		"Ability_Hunter_Pet_Devilsaur",
		AdminUtils.buttonFunction(nil, "AllBot", "Kill"),
		"F13"
	)
	OverlayButton("ADMINTOOLS_14", 45, -85, overlay, "Summon your bots, tell them to follow you. If you target a dead NPCBot and use this, they will be revived.", 
		"Ability_hunter_beastcall",
		AdminUtils.buttonFunction(nil, "AllBot", "Return"),
		"F14"
	)
	OverlayButton("ADMINTOOLS_15",  85, -85, overlay, "Places PlayerBot in guard state, places NPCBot in IDLE state", 
		"Ability_rogue_feigndeath",
		AdminUtils.buttonFunction(nil, "AllBot", "Guard"),
		"F15"
	)
	OverlayButton("ADMINTOOLS_16", 125, -85, overlay, "Places PlayerBot in free state and enabled grind startegy. Does nothing for NPCBots.", 
		"Spell_nature_massteleport",
		AdminUtils.buttonFunction(nil, "AllBot", "Grind"),
		"F16"
	)
	OverlayButton("ADMINTOOLS_17", 165, -85, overlay, "Respawn targeted dead creature", 
		"Spell_shaman_blessingofeternals",
		AdminUtils.buttonFunction(nil, "Management", "RespawnCreature"),
		"F17"
	)
	OverlayButton("ADMINTOOLS_18", 205, -85, overlay, "Rain", 
		"Spell_frost_summonwaterelemental",
		AdminUtils.buttonFunction(nil, "Weather", "LightRain"), 
		"F18"
	)

	-- Row 4
	OverlayButton("ADMINTOOLS_19",  5, -125, overlay, "Frost Presence", 	
		"Spell_deathknight_frostpresence",
		AdminUtils.buttonFunction(nil, "Action", "FrostPresence"),
		"F19"
	)
	OverlayButton("ADMINTOOLS_20", 45, -125, overlay, "Blood Presence", 
		"Spell_deathknight_bloodpresence",
		AdminUtils.buttonFunction(nil, "Action", "BloodPresence"),
		"F20"
	)
	OverlayButton("ADMINTOOLS_21",  85, -125, overlay, "Unholy Presence", 
		"Spell_deathknight_unholypresence",
		AdminUtils.buttonFunction(nil, "Action", "UnholyPresence"),
		"F21"
	)
	OverlayButton("ADMINTOOLS_22", 125, -125, overlay, "Draw upon the energies of the fel to transform into a demon", 
		"Ability_warlock_demonicpower",
		AdminUtils.buttonFunction(nil, "Action", "Morph"),
		"F22"
	)
	OverlayButton("ADMINTOOLS_23", 165, -125, overlay, "Expel the fel energy from your party to return to normal form", 
		"Ability_hunter_beastwithin",
		AdminUtils.buttonFunction(nil, "Action", "Unmorph"),
		"F23"
	)
	OverlayButton("ADMINTOOLS_24", 205, -125, overlay, "Ignite the air around your body with intense flames", 
		"Spell_fire_burnout",
		AdminUtils.buttonFunction(nil, "Action", "Immolate"),
		"F24"
	)
	
	return overlay
end


local function runApp()

	-- When user opens quest log, save the ID so that quest can be completed or 
	-- deleted
	SaveQuestFromLogDetails()

	-- Initialize settings for this addon
	AdminUtils.SetupSettingsDB()


	-- If the button was pressed, the server message saying what object was 
	-- created will be used to delete it
	DeleteLastObjectIfFlagged()
		
	
	-- Adds a bunch of talents from other classes automatically on login. IMBA
	AutorunAddTalents()

	local overlay = BuildOverlay()

	-- Register the key bindings
	for _, binding in ipairs(AdminUtils.adminToolsBindings) do
		SetBinding(binding.key, binding.buttonName)
	end
	
end

runApp()
