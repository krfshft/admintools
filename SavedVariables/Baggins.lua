
BagginsDB = {
	["account"] = {
		["profiles"] = {
			["yeeeeee"] = {
				["showsectiontitle"] = true,
				["compressempty"] = true,
				["showused"] = true,
				["skin"] = "oSkin",
				["hidedefaultbank"] = false,
				["layoutanchor"] = "BOTTOMRIGHT",
				["topoffset"] = 50,
				["compressall"] = true,
				["hideemptysections"] = false,
				["overridedefaultbags"] = true,
				["shrinkwidth"] = false,
				["categories"] = {
					["AmmoBag"] = {
						{
							["type"] = "AmmoBag",
						}, -- [1]
						["name"] = "AmmoBag",
					},
					["Bags"] = {
						{
							["bagid"] = 1,
							["type"] = "Bag",
						}, -- [1]
						{
							["operation"] = "OR",
							["type"] = "Bag",
							["bagid"] = 2,
						}, -- [2]
						{
							["operation"] = "OR",
							["type"] = "Bag",
							["bagid"] = 3,
						}, -- [3]
						{
							["operation"] = "OR",
							["type"] = "Bag",
							["bagid"] = 4,
						}, -- [4]
						{
							["operation"] = "OR",
							["type"] = "Bag",
							["bagid"] = 0,
						}, -- [5]
						{
							["operation"] = "NOT",
							["type"] = "AmmoBag",
						}, -- [6]
						{
							["ctype"] = "Soul Bag",
							["type"] = "ContainerType",
							["operation"] = "NOT",
						}, -- [7]
						["name"] = "Bags",
					},
					["Gathered"] = {
						{
							["setname"] = "Tradeskill.Gather",
							["type"] = "PTSet",
						}, -- [1]
						["name"] = "Gathered",
					},
					["Consumables"] = {
						{
							["itype"] = "Consumable",
							["type"] = "ItemType",
						}, -- [1]
						["name"] = "Consumables",
					},
					["BankBags"] = {
						{
							["bagid"] = -1,
							["type"] = "Bag",
						}, -- [1]
						{
							["operation"] = "OR",
							["type"] = "Bag",
							["bagid"] = 5,
						}, -- [2]
						{
							["operation"] = "OR",
							["type"] = "Bag",
							["bagid"] = 6,
						}, -- [3]
						{
							["operation"] = "OR",
							["type"] = "Bag",
							["bagid"] = 7,
						}, -- [4]
						{
							["operation"] = "OR",
							["type"] = "Bag",
							["bagid"] = 8,
						}, -- [5]
						{
							["operation"] = "OR",
							["type"] = "Bag",
							["bagid"] = 9,
						}, -- [6]
						{
							["operation"] = "OR",
							["type"] = "Bag",
							["bagid"] = 10,
						}, -- [7]
						{
							["operation"] = "OR",
							["type"] = "Bag",
							["bagid"] = 11,
						}, -- [8]
						["name"] = "BankBags",
					},
					["Empty"] = {
						{
							["type"] = "Empty",
						}, -- [1]
						{
							["operation"] = "NOT",
							["type"] = "AmmoBag",
						}, -- [2]
						{
							["ctype"] = "Soul Bag",
							["type"] = "ContainerType",
							["operation"] = "NOT",
						}, -- [3]
						["name"] = "Empty",
					},
					["Quest"] = {
						{
							["itype"] = "Quest",
							["type"] = "ItemType",
						}, -- [1]
						{
							["text"] = "ITEM_BIND_QUEST",
							["type"] = "Tooltip",
						}, -- [2]
						["name"] = "Quest",
					},
					["New"] = {
						{
							["name"] = "New",
							["type"] = "NewItems",
						}, -- [1]
					},
					["Potions"] = {
						{
							["setname"] = "Consumable.Potion",
							["type"] = "PTSet",
						}, -- [1]
						["name"] = "Potions",
					},
					["FirstAid"] = {
						{
							["setname"] = "Tradeskill.Crafted.First Aid",
							["type"] = "PTSet",
						}, -- [1]
						["name"] = "FirstAid",
					},
					["Food"] = {
						{
							["setname"] = "Consumable.Food.Edible",
							["type"] = "PTSet",
						}, -- [1]
						["name"] = "Food",
					},
					["Other"] = {
						{
							["type"] = "Other",
						}, -- [1]
						["name"] = "Other",
					},
					["TrashEquip"] = {
						{
							["itype"] = "Armor",
							["type"] = "ItemType",
						}, -- [1]
						{
							["operation"] = "OR",
							["type"] = "ItemType",
							["itype"] = "Weapon",
						}, -- [2]
						{
							["operation"] = "AND",
							["type"] = "Quality",
							["comp"] = "<=",
							["quality"] = 1,
						}, -- [3]
						{
							["operation"] = "NOT",
							["type"] = "PTSet",
							["setname"] = "Tradeskill.Tool",
						}, -- [4]
						{
							["operation"] = "NOT",
							["type"] = "ItemType",
							["itype"] = "Quest",
						}, -- [5]
						["name"] = "TrashEquip",
					},
					["Trash"] = {
						{
							["type"] = "Quality",
							["comp"] = "<=",
							["quality"] = 0,
						}, -- [1]
						["name"] = "Trash",
					},
					["Scrolls"] = {
						{
							["setname"] = "Consumable.Scroll",
							["type"] = "PTSet",
						}, -- [1]
						["name"] = "Scrolls",
					},
					["SoulBag"] = {
						{
							["ctype"] = "Soul Bag",
							["type"] = "ContainerType",
						}, -- [1]
						["name"] = "SoulBag",
					},
					["Tradeskill Mats"] = {
						{
							["setname"] = "Tradeskill.Mat.ByProfession",
							["type"] = "PTSet",
						}, -- [1]
						["name"] = "Tradeskill Mats",
					},
					["Misc Consumables"] = {
						{
							["itype"] = "Consumable",
							["type"] = "ItemType",
						}, -- [1]
						{
							["operation"] = "NOT",
							["type"] = "PTSet",
							["setname"] = "Consumable.Food.Edible",
						}, -- [2]
						{
							["operation"] = "NOT",
							["type"] = "PTSet",
							["setname"] = "Consumable.Water",
						}, -- [3]
						{
							["operation"] = "NOT",
							["type"] = "PTSet",
							["setname"] = "Consumable.Potion",
						}, -- [4]
						{
							["operation"] = "NOT",
							["type"] = "PTSet",
							["setname"] = "Consumable.Scroll",
						}, -- [5]
						{
							["operation"] = "NOT",
							["type"] = "PTSet",
							["setname"] = "Consumable.Bandage",
						}, -- [6]
						["name"] = "Misc Consumables",
					},
					["KeyRing"] = {
						{
							["bagid"] = -2,
							["type"] = "Bag",
						}, -- [1]
						["name"] = "KeyRing",
					},
					["Weapons"] = {
						{
							["itype"] = "Weapon",
							["type"] = "ItemType",
						}, -- [1]
						{
							["type"] = "ItemType",
							["itype"] = "Armor",
							["isubtype"] = "Shields",
						}, -- [2]
						{
							["operation"] = "NOT",
							["type"] = "PTSet",
							["setname"] = "Tradeskill.Tool",
						}, -- [3]
						["name"] = "Weapons",
					},
					["Armor"] = {
						{
							["itype"] = "Armor",
							["type"] = "ItemType",
						}, -- [1]
						{
							["operation"] = "NOT",
							["type"] = "ItemType",
							["itype"] = "Armor",
							["isubtype"] = "Shields",
						}, -- [2]
						["name"] = "Armor",
					},
					["Water"] = {
						{
							["setname"] = "Consumable.Water",
							["type"] = "PTSet",
						}, -- [1]
						["name"] = "Water",
					},
				},
				["showspecialcount"] = true,
				["highlightnew"] = true,
				["scale"] = 1,
				["bags"] = {
					{
						["y"] = 436.4499620485015,
						["x"] = 768.7670750456263,
						["name"] = "Other",
						["sections"] = {
							{
								["allowdupes"] = true,
								["cats"] = {
									"New", -- [1]
								},
								["name"] = "New",
							}, -- [1]
							{
								["cats"] = {
									"Other", -- [1]
								},
								["name"] = "Other",
							}, -- [2]
							{
								["cats"] = {
									"Trash", -- [1]
									"TrashEquip", -- [2]
								},
								["name"] = "Trash",
							}, -- [3]
							{
								["cats"] = {
									"Empty", -- [1]
								},
								["name"] = "Empty",
							}, -- [4]
						},
						["openWithAll"] = true,
					}, -- [1]
					{
						["y"] = 754.2557623942811,
						["x"] = 470.3775959026743,
						["name"] = "Equipment",
						["sections"] = {
							{
								["cats"] = {
									"Armor", -- [1]
								},
								["name"] = "Armor",
							}, -- [1]
							{
								["cats"] = {
									"Weapons", -- [1]
								},
								["name"] = "Weapons",
							}, -- [2]
						},
						["openWithAll"] = true,
					}, -- [2]
					{
						["y"] = 257.556961885945,
						["x"] = 470.7392932766932,
						["name"] = "Quest",
						["sections"] = {
							{
								["cats"] = {
									"Quest", -- [1]
								},
								["name"] = "Quest Items",
							}, -- [1]
						},
						["openWithAll"] = true,
					}, -- [3]
					{
						["y"] = 752.9114946708218,
						["x"] = 767.9776433907733,
						["name"] = "Consumables",
						["sections"] = {
							{
								["cats"] = {
									"Water", -- [1]
								},
								["name"] = "Water",
							}, -- [1]
							{
								["cats"] = {
									"Food", -- [1]
								},
								["name"] = "Food",
							}, -- [2]
							{
								["cats"] = {
									"FirstAid", -- [1]
								},
								["name"] = "First Aid",
							}, -- [3]
							{
								["cats"] = {
									"Potions", -- [1]
								},
								["name"] = "Potions",
							}, -- [4]
							{
								["cats"] = {
									"Scrolls", -- [1]
								},
								["name"] = "Scrolls",
							}, -- [5]
							{
								["cats"] = {
									"Misc Consumables", -- [1]
								},
								["name"] = "Misc",
							}, -- [6]
						},
						["priority"] = 1,
						["openWithAll"] = true,
						["isBank"] = false,
					}, -- [4]
					{
						["y"] = 752.5110715179389,
						["x"] = 1067.911321719493,
						["name"] = "Trade Goods",
						["sections"] = {
							{
								["cats"] = {
									"Tradeskill Mats", -- [1]
								},
								["name"] = "Mats",
							}, -- [1]
							{
								["cats"] = {
									"Gathered", -- [1]
								},
								["name"] = "Gathered",
							}, -- [2]
						},
						["openWithAll"] = true,
					}, -- [5]
					{
						["y"] = 188.3778397715702,
						["x"] = 82.85614108178081,
						["name"] = "Ammo",
						["sections"] = {
							{
								["cats"] = {
									"AmmoBag", -- [1]
								},
								["name"] = "Ammo",
							}, -- [1]
							{
								["cats"] = {
									"SoulBag", -- [1]
								},
								["name"] = "SoulShards",
							}, -- [2]
						},
						["openWithAll"] = true,
					}, -- [6]
					{
						["openWithAll"] = false,
						["name"] = "KeyRing",
						["sections"] = {
							{
								["cats"] = {
									"KeyRing", -- [1]
								},
								["name"] = "KeyRing",
							}, -- [1]
						},
					}, -- [7]
					{
						["sections"] = {
							{
								["cats"] = {
									"Armor", -- [1]
								},
								["name"] = "Armor",
							}, -- [1]
							{
								["cats"] = {
									"Weapons", -- [1]
								},
								["name"] = "Weapons",
							}, -- [2]
						},
						["name"] = "Bank Equipment",
						["openWithAll"] = true,
						["isBank"] = true,
					}, -- [8]
					{
						["sections"] = {
							{
								["cats"] = {
									"Quest", -- [1]
								},
								["name"] = "Quest Items",
							}, -- [1]
						},
						["name"] = "Bank Quest",
						["openWithAll"] = true,
						["isBank"] = true,
					}, -- [9]
					{
						["sections"] = {
							{
								["cats"] = {
									"Water", -- [1]
								},
								["name"] = "Water",
							}, -- [1]
							{
								["cats"] = {
									"Food", -- [1]
								},
								["name"] = "Food",
							}, -- [2]
							{
								["cats"] = {
									"FirstAid", -- [1]
								},
								["name"] = "First Aid",
							}, -- [3]
							{
								["cats"] = {
									"Potions", -- [1]
								},
								["name"] = "Potions",
							}, -- [4]
							{
								["cats"] = {
									"Scrolls", -- [1]
								},
								["name"] = "Scrolls",
							}, -- [5]
							{
								["cats"] = {
									"Misc Consumables", -- [1]
								},
								["name"] = "Misc",
							}, -- [6]
						},
						["name"] = "Bank Consumables",
						["openWithAll"] = true,
						["isBank"] = true,
					}, -- [10]
					{
						["sections"] = {
							{
								["cats"] = {
									"Tradeskill Mats", -- [1]
								},
								["name"] = "Mats",
							}, -- [1]
							{
								["cats"] = {
									"Gathered", -- [1]
								},
								["name"] = "Gathered",
							}, -- [2]
						},
						["name"] = "Bank Trade Goods",
						["openWithAll"] = true,
						["isBank"] = true,
					}, -- [11]
					{
						["sections"] = {
							{
								["cats"] = {
									"Other", -- [1]
								},
								["name"] = "Other",
							}, -- [1]
							{
								["cats"] = {
									"Trash", -- [1]
									"TrashEquip", -- [2]
								},
								["name"] = "Trash",
							}, -- [2]
							{
								["cats"] = {
									"Empty", -- [1]
								},
								["name"] = "Empty",
							}, -- [3]
						},
						["name"] = "Bank Other",
						["openWithAll"] = true,
						["isBank"] = true,
					}, -- [12]
				},
				["showempty"] = true,
				["qualitycolorintensity"] = 0.3,
				["sort"] = "quality",
				["showtotal"] = true,
				["rightoffset"] = 50,
				["qualitycolormin"] = 2,
				["leftoffset"] = 50,
				["layout"] = "manual",
				["optimizesectionlayout"] = true,
				["detachedTooltip"] = {
					["fontSizePercent"] = 1,
				},
				["columns"] = 7,
				["compressammo"] = true,
				["openatauction"] = true,
				["showsoulcount"] = true,
				["moneybag"] = 1,
				["shrinkbagtitle"] = false,
				["combinecounts"] = false,
				["bottomoffset"] = 50,
				["sortnewfirst"] = true,
				["showammocount"] = true,
				["hideduplicates"] = "disabled",
				["compressshards"] = true,
				["compressstackable"] = false,
				["qualitycolor"] = true,
			},
		},
	},
	["profiles"] = {
		["Default"] = {
			["lock"] = false,
			["hidedefaultbank"] = true,
			["alwaysresort"] = true,
			["detachedTooltip"] = {
				["fontSizePercent"] = 1,
			},
			["overridedefaultbags"] = true,
			["shrinkwidth"] = false,
			["moneybag"] = 2,
			["compressstackable"] = true,
			["bags"] = {
				{
					["y"] = 354.5335251002711,
					["x"] = 916.3333711058853,
					["name"] = "Misc",
					["sections"] = {
						{
							["name"] = "Reagents",
							["cats"] = {
								"Reagents", -- [1]
							},
						}, -- [1]
						{
							["name"] = "Quest",
							["cats"] = {
								"Quest", -- [1]
							},
						}, -- [2]
						{
							["name"] = "Scrolls, Other",
							["cats"] = {
								"Consumables", -- [1]
							},
						}, -- [3]
						{
							["cats"] = {
								"Other", -- [1]
							},
							["name"] = "Other",
						}, -- [4]
						{
							["cats"] = {
								"New", -- [1]
							},
							["name"] = "New",
							["allowdupes"] = true,
						}, -- [5]
						{
							["cats"] = {
								"Trash", -- [1]
							},
							["name"] = "Trash",
						}, -- [6]
					},
					["openWithAll"] = true,
				}, -- [1]
				{
					["y"] = 767.9999824928667,
					["x"] = 468.6397678225865,
					["name"] = "Equipment",
					["sections"] = {
						{
							["name"] = "1H, Offhand & Shields",
							["cats"] = {
								"1H", -- [1]
								"OffHand and Shields", -- [2]
							},
						}, -- [1]
						{
							["name"] = "2H",
							["cats"] = {
								"2H", -- [1]
							},
						}, -- [2]
						{
							["name"] = "Ranged",
							["cats"] = {
								"Ranged", -- [1]
								"Ammo", -- [2]
							},
						}, -- [3]
						{
							["name"] = "Light",
							["cats"] = {
								"typecloth", -- [1]
								"typeleather", -- [2]
							},
						}, -- [4]
						{
							["name"] = "Heavy",
							["cats"] = {
								"typeplate", -- [1]
								"typemail", -- [2]
							},
						}, -- [5]
						{
							["name"] = "Amulets",
							["cats"] = {
								"typejewel", -- [1]
							},
						}, -- [6]
						{
							["cats"] = {
								"jrings", -- [1]
							},
							["name"] = "Rings",
							["allowdupes"] = true,
						}, -- [7]
						{
							["name"] = "Trinkets",
							["cats"] = {
								"jtrinkets", -- [1]
							},
						}, -- [8]
						{
							["priority"] = 1,
							["name"] = "Relics, Misc",
							["cats"] = {
								"Armor", -- [1]
							},
						}, -- [9]
						{
							["name"] = "Misc",
							["cats"] = {
								"Empty", -- [1]
								"Item Enhancements", -- [2]
							},
						}, -- [10]
						{
							["name"] = "Potions, Food & Drink",
							["cats"] = {
								"Consumes", -- [1]
							},
						}, -- [11]
					},
					["openWithAll"] = true,
				}, -- [2]
				{
					["y"] = 767.9999824928667,
					["x"] = 916.3333711058853,
					["name"] = "Trade Goods",
					["sections"] = {
						{
							["cats"] = {
								"Meat", -- [1]
							},
							["name"] = "Meat",
						}, -- [1]
						{
							["name"] = "Minerals",
							["cats"] = {
								"Minerals", -- [1]
							},
						}, -- [2]
						{
							["name"] = "Arcana",
							["cats"] = {
								"Arcana", -- [1]
							},
						}, -- [3]
						{
							["name"] = "Textiles",
							["cats"] = {
								"Textiles", -- [1]
							},
						}, -- [4]
						{
							["name"] = "Alchemy",
							["cats"] = {
								"Alch", -- [1]
							},
						}, -- [5]
						{
							["name"] = "Parts",
							["cats"] = {
							},
						}, -- [6]
						{
							["name"] = "Tools & Recipes",
							["cats"] = {
								"Tools", -- [1]
								"Recipes", -- [2]
							},
						}, -- [7]
					},
					["openWithAll"] = true,
				}, -- [3]
				{
					["y"] = 182.8551095286608,
					["x"] = 6.555508315170252,
					["name"] = "KeyRing",
					["sections"] = {
						{
							["cats"] = {
								"KeyRing", -- [1]
							},
							["name"] = "KeyRing",
						}, -- [1]
					},
					["openWithAll"] = false,
				}, -- [4]
				{
					["y"] = 767.9999824928667,
					["x"] = 5.835710752824534e-006,
					["name"] = "Bank Equipment",
					["sections"] = {
						{
							["name"] = "1H, Offhand & Shields",
							["cats"] = {
								"1H", -- [1]
								"OffHand and Shields", -- [2]
							},
						}, -- [1]
						{
							["cats"] = {
								"2H", -- [1]
							},
							["name"] = "2H",
						}, -- [2]
						{
							["name"] = "Light",
							["cats"] = {
								"typecloth", -- [1]
								"typeleather", -- [2]
							},
						}, -- [3]
						{
							["name"] = "Heavy",
							["cats"] = {
								"typeplate", -- [1]
								"typemail", -- [2]
							},
						}, -- [4]
						{
							["name"] = "Amulets",
							["cats"] = {
								"jneck", -- [1]
							},
						}, -- [5]
						{
							["name"] = "Rings",
							["cats"] = {
								"jrings", -- [1]
							},
						}, -- [6]
						{
							["name"] = "Trinkets",
							["cats"] = {
								"jtrinkets", -- [1]
							},
						}, -- [7]
						{
							["cats"] = {
								"Armor", -- [1]
							},
							["name"] = "Misc",
						}, -- [8]
					},
					["openWithAll"] = true,
					["isBank"] = true,
				}, -- [5]
				{
					["y"] = 212.0000046503323,
					["x"] = 927.8000532189498,
					["name"] = "Bank Quest",
					["sections"] = {
						{
							["cats"] = {
								"Quest", -- [1]
							},
							["name"] = "Quest Items",
						}, -- [1]
					},
					["openWithAll"] = true,
					["isBank"] = true,
				}, -- [6]
				{
					["y"] = 767.9999824928667,
					["x"] = 447.2888733756236,
					["name"] = "Bank Trade Goods",
					["sections"] = {
						{
							["name"] = "Tools & Recipes",
							["cats"] = {
								"Tools", -- [1]
								"Recipes", -- [2]
							},
						}, -- [1]
						{
							["cats"] = {
								"Minerals", -- [1]
							},
							["name"] = "Minerals",
						}, -- [2]
						{
							["cats"] = {
								"Arcana", -- [1]
							},
							["name"] = "Arcana",
						}, -- [3]
						{
							["name"] = "Textiles",
							["cats"] = {
								"Textiles", -- [1]
							},
						}, -- [4]
						{
							["name"] = "Alchemy",
							["cats"] = {
								"Alch", -- [1]
							},
						}, -- [5]
						{
							["name"] = "Parts",
							["cats"] = {
								"Parts", -- [1]
							},
						}, -- [6]
						{
							["name"] = "Other",
							["cats"] = {
								"Tradeskill Mats", -- [1]
							},
						}, -- [7]
					},
					["openWithAll"] = true,
					["isBank"] = true,
				}, -- [7]
				{
					["y"] = 191.9999956232167,
					["x"] = 469.1331888675696,
					["name"] = "Bank Misc",
					["sections"] = {
						{
							["name"] = "",
							["cats"] = {
								"Empty", -- [1]
							},
						}, -- [1]
						{
							["cats"] = {
								"Other", -- [1]
							},
							["name"] = "Other",
						}, -- [2]
						{
							["cats"] = {
								"Trash", -- [1]
								"TrashEquip", -- [2]
							},
							["name"] = "Trash",
						}, -- [3]
					},
					["openWithAll"] = true,
					["isBank"] = true,
				}, -- [8]
			},
			["sort"] = "type",
			["columns"] = 11,
			["sorttype"] = "quality",
			["shrinkbagtitle"] = true,
			["categories"] = {
				["AmmoBag"] = {
					{
						["type"] = "AmmoBag",
					}, -- [1]
					["name"] = "AmmoBag",
				},
				["Bags"] = {
					{
						["bagid"] = 1,
						["type"] = "Bag",
					}, -- [1]
					{
						["operation"] = "OR",
						["type"] = "Bag",
						["bagid"] = 2,
					}, -- [2]
					{
						["operation"] = "OR",
						["type"] = "Bag",
						["bagid"] = 3,
					}, -- [3]
					{
						["operation"] = "OR",
						["type"] = "Bag",
						["bagid"] = 4,
					}, -- [4]
					{
						["operation"] = "OR",
						["type"] = "Bag",
						["bagid"] = 0,
					}, -- [5]
					{
						["operation"] = "NOT",
						["type"] = "AmmoBag",
					}, -- [6]
					{
						["ctype"] = "Soul Bag",
						["type"] = "ContainerType",
						["operation"] = "NOT",
					}, -- [7]
					["name"] = "Bags",
				},
				["KeyRing"] = {
					{
						["bagid"] = -2,
						["type"] = "Bag",
					}, -- [1]
					["name"] = "KeyRing",
				},
				["Consumables"] = {
					{
						["itype"] = "Consumable",
						["type"] = "ItemType",
					}, -- [1]
					{
						["operation"] = "NOT",
						["type"] = "ItemType",
						["itype"] = "Consumable",
						["isubtype"] = "Food & Drink",
					}, -- [2]
					{
						["operation"] = "NOT",
						["type"] = "ItemType",
						["itype"] = "Consumable",
						["isubtype"] = "Potion",
					}, -- [3]
					{
						["operation"] = "NOT",
						["type"] = "ItemType",
						["itype"] = "Consumable",
						["isubtype"] = "Elixir",
					}, -- [4]
					{
						["operation"] = "NOT",
						["type"] = "ItemType",
						["itype"] = "Consumable",
						["isubtype"] = "Flask",
					}, -- [5]
					{
						["operation"] = "NOT",
						["type"] = "ItemType",
						["itype"] = "Consumable",
						["isubtype"] = "Item Enhancement",
					}, -- [6]
					{
						["operation"] = "NOT",
						["type"] = "PTSet",
						["setname"] = "Consumable.Weapon Buff",
					}, -- [7]
					["name"] = "Consumables",
				},
				["typeleather"] = {
					{
						["type"] = "ItemType",
						["itype"] = "Armor",
						["isubtype"] = "Leather",
					}, -- [1]
					["name"] = "typeleather",
				},
				["BankBags"] = {
					{
						["bagid"] = -1,
						["type"] = "Bag",
					}, -- [1]
					{
						["operation"] = "OR",
						["type"] = "Bag",
						["bagid"] = 5,
					}, -- [2]
					{
						["operation"] = "OR",
						["type"] = "Bag",
						["bagid"] = 6,
					}, -- [3]
					{
						["operation"] = "OR",
						["type"] = "Bag",
						["bagid"] = 7,
					}, -- [4]
					{
						["operation"] = "OR",
						["type"] = "Bag",
						["bagid"] = 8,
					}, -- [5]
					{
						["operation"] = "OR",
						["type"] = "Bag",
						["bagid"] = 9,
					}, -- [6]
					{
						["operation"] = "OR",
						["type"] = "Bag",
						["bagid"] = 10,
					}, -- [7]
					{
						["operation"] = "OR",
						["type"] = "Bag",
						["bagid"] = 11,
					}, -- [8]
					["name"] = "BankBags",
				},
				["Empty"] = {
					{
						["type"] = "Empty",
					}, -- [1]
					{
						["operation"] = "NOT",
						["type"] = "AmmoBag",
					}, -- [2]
					{
						["ctype"] = "Soul Bag",
						["type"] = "ContainerType",
						["operation"] = "NOT",
					}, -- [3]
					["name"] = "Empty",
				},
				["Quest"] = {
					{
						["itype"] = "Quest",
						["type"] = "ItemType",
					}, -- [1]
					{
						["type"] = "Tooltip",
						["text"] = "ITEM_BIND_QUEST",
					}, -- [2]
					["name"] = "Quest",
				},
				["New"] = {
				},
				["Potions"] = {
					{
						["setname"] = "Consumable.Potion",
						["type"] = "PTSet",
					}, -- [1]
					["name"] = "Potions",
				},
				["Food"] = {
					{
						["setname"] = "Consumable.Food.Edible",
						["type"] = "PTSet",
					}, -- [1]
					["name"] = "Food",
				},
				["Magimats"] = {
					{
						["type"] = "ItemType",
						["itype"] = "Trade Goods",
						["isubtype"] = "Enchanting",
					}, -- [1]
					{
						["type"] = "ItemType",
						["itype"] = "Trade Goods",
						["isubtype"] = "Elemental",
					}, -- [2]
					{
						["type"] = "New",
					}, -- [3]
					{
						["type"] = "ItemType",
						["itype"] = "Trade Goods",
						["isubtype"] = "Jewelcrafting",
					}, -- [4]
					["name"] = "Magimats",
				},
				["SoulBag"] = {
					{
						["ctype"] = "Soul Bag",
						["type"] = "ContainerType",
					}, -- [1]
					["name"] = "SoulBag",
				},
				["Misc Consumables"] = {
					{
						["itype"] = "Consumable",
						["type"] = "ItemType",
					}, -- [1]
					{
						["operation"] = "NOT",
						["type"] = "PTSet",
						["setname"] = "Consumable.Food.Edible",
					}, -- [2]
					{
						["operation"] = "NOT",
						["type"] = "PTSet",
						["setname"] = "Consumable.Water",
					}, -- [3]
					{
						["operation"] = "NOT",
						["type"] = "PTSet",
						["setname"] = "Consumable.Potion",
					}, -- [4]
					{
						["operation"] = "NOT",
						["type"] = "PTSet",
						["setname"] = "Consumable.Scroll",
					}, -- [5]
					{
						["operation"] = "NOT",
						["type"] = "PTSet",
						["setname"] = "Consumable.Bandage",
					}, -- [6]
					["name"] = "Misc Consumables",
				},
				["Scrolls"] = {
					{
						["setname"] = "Consumable.Scroll",
						["type"] = "PTSet",
					}, -- [1]
					["name"] = "Scrolls",
				},
				["Textiles"] = {
					{
						["type"] = "ItemType",
						["itype"] = "Trade Goods",
						["isubtype"] = "Cloth",
					}, -- [1]
					{
						["type"] = "ItemType",
						["itype"] = "Trade Goods",
						["isubtype"] = "Leather",
					}, -- [2]
					["name"] = "Textiles",
				},
				["Ammo"] = {
					{
						["itype"] = "Projectile",
						["type"] = "ItemType",
					}, -- [1]
					["name"] = "Ammo",
				},
				["Arcana"] = {
					{
						["type"] = "ItemType",
						["itype"] = "Trade Goods",
						["isubtype"] = "Enchanting",
					}, -- [1]
					{
						["type"] = "ItemType",
						["itype"] = "Trade Goods",
						["isubtype"] = "Jewelcrafting",
					}, -- [2]
					{
						["type"] = "ItemType",
						["itype"] = "Trade Goods",
						["isubtype"] = "Weapon Enchantment",
					}, -- [3]
					{
						["type"] = "ItemType",
						["itype"] = "Trade Goods",
						["isubtype"] = "Armor Enchantment",
					}, -- [4]
					{
						["operation"] = "NOT",
						["type"] = "PTSet",
						["setname"] = "Tradeskill.Tool",
					}, -- [5]
					["name"] = "Arcana",
				},
				["OffHand and Shields"] = {
					{
						["type"] = "ItemType",
						["itype"] = "Armor",
						["isubtype"] = "Shields",
					}, -- [1]
					{
						["type"] = "EquipLoc",
						["equiploc"] = "INVTYPE_WEAPONOFFHAND",
					}, -- [2]
					{
						["type"] = "EquipLoc",
						["equiploc"] = "INVTYPE_HOLDABLE",
					}, -- [3]
					["name"] = "OffHand and Shields",
				},
				["Tools"] = {
					{
						["setname"] = "Tradeskill.Tool",
						["type"] = "PTSet",
					}, -- [1]
					{
						["type"] = "ItemName",
						["match"] = "Hearthstone",
					}, -- [2]
					["name"] = "Tools",
				},
				["1H"] = {
					{
						["type"] = "ItemType",
						["itype"] = "Weapon",
						["isubtype"] = "One-Handed Swords",
					}, -- [1]
					{
						["type"] = "ItemType",
						["itype"] = "Weapon",
						["isubtype"] = "Daggers",
					}, -- [2]
					{
						["type"] = "ItemType",
						["itype"] = "Weapon",
						["isubtype"] = "One-Handed Axes",
					}, -- [3]
					{
						["type"] = "ItemType",
						["itype"] = "Weapon",
						["isubtype"] = "One-Handed Maces",
					}, -- [4]
					{
						["type"] = "ItemType",
						["itype"] = "Weapon",
						["isubtype"] = "Fist Weapons",
					}, -- [5]
					{
						["type"] = "EquipLoc",
						["equiploc"] = "INVTYPE_WEAPONOFFHAND",
					}, -- [6]
					["name"] = "1H",
				},
				["jneck"] = {
					{
						["equiploc"] = "INVTYPE_NECK",
						["type"] = "EquipLoc",
					}, -- [1]
					["name"] = "jneck",
				},
				["jtrinkets"] = {
					{
						["equiploc"] = "INVTYPE_TRINKET",
						["type"] = "EquipLoc",
					}, -- [1]
					["name"] = "jtrinkets",
				},
				["Item Enhancements"] = {
					{
						["type"] = "ItemType",
						["itype"] = "Consumable",
						["isubtype"] = "Item Enhancement",
					}, -- [1]
					{
						["setname"] = "Consumable.Weapon Buff",
						["type"] = "PTSet",
					}, -- [2]
					["name"] = "Item Enhancements",
				},
				["2H"] = {
					{
						["type"] = "ItemType",
						["itype"] = "Weapon",
						["isubtype"] = "Two-Handed Swords",
					}, -- [1]
					{
						["type"] = "ItemType",
						["itype"] = "Weapon",
						["isubtype"] = "Two-Handed Axes",
					}, -- [2]
					{
						["type"] = "ItemType",
						["itype"] = "Weapon",
						["isubtype"] = "Two-Handed Maces",
					}, -- [3]
					{
						["type"] = "ItemType",
						["itype"] = "Weapon",
						["isubtype"] = "Staves",
					}, -- [4]
					{
						["type"] = "ItemType",
						["itype"] = "Weapon",
						["isubtype"] = "Polearms",
					}, -- [5]
					["name"] = "2H",
				},
				["Water"] = {
					{
						["setname"] = "Consumable.Water",
						["type"] = "PTSet",
					}, -- [1]
					["name"] = "Water",
				},
				["tradeother"] = {
					{
						["type"] = "ItemType",
						["itype"] = "Trade Goods",
						["isubtype"] = "Meat",
					}, -- [1]
					{
						["type"] = "ItemType",
						["itype"] = "Trade Goods",
						["isubtype"] = "Materials",
					}, -- [2]
					{
						["type"] = "ItemType",
						["itype"] = "Trade Goods",
						["isubtype"] = "Other",
					}, -- [3]
					["name"] = "tradeother",
				},
				["Consumes"] = {
					{
						["isubtype"] = "Potion",
						["itype"] = "Consumable",
						["type"] = "ItemType",
					}, -- [1]
					{
						["type"] = "ItemType",
						["itype"] = "Consumable",
						["isubtype"] = "Food & Drink",
					}, -- [2]
					{
						["type"] = "ItemType",
						["itype"] = "Consumable",
						["isubtype"] = "Elixir",
					}, -- [3]
					{
						["type"] = "ItemType",
						["itype"] = "Consumable",
						["isubtype"] = "Flask",
					}, -- [4]
					["name"] = "Consumes",
				},
				["jrings"] = {
					{
						["equiploc"] = "INVTYPE_FINGER",
						["type"] = "EquipLoc",
					}, -- [1]
					["name"] = "jrings",
				},
				["Armor"] = {
					{
						["itype"] = "Armor",
						["type"] = "ItemType",
					}, -- [1]
					{
						["operation"] = "NOT",
						["type"] = "ItemType",
						["itype"] = "Armor",
						["isubtype"] = "Shields",
					}, -- [2]
					{
						["operation"] = "NOT",
						["type"] = "ItemType",
						["itype"] = "Armor",
						["isubtype"] = "Plate",
					}, -- [3]
					{
						["operation"] = "NOT",
						["type"] = "ItemType",
						["itype"] = "Armor",
						["isubtype"] = "Mail",
					}, -- [4]
					{
						["operation"] = "NOT",
						["type"] = "ItemType",
						["itype"] = "Armor",
						["isubtype"] = "Leather",
					}, -- [5]
					{
						["operation"] = "NOT",
						["type"] = "ItemType",
						["itype"] = "Armor",
						["isubtype"] = "Cloth",
					}, -- [6]
					{
						["operation"] = "NOT",
						["type"] = "ItemType",
						["itype"] = "Armor",
						["isubtype"] = "Miscellaneous",
					}, -- [7]
					{
						["match"] = "Shirt",
						["type"] = "ItemName",
					}, -- [8]
					["name"] = "Armor",
				},
				["typejewel"] = {
					{
						["type"] = "EquipLoc",
						["equiploc"] = "INVTYPE_NECK",
					}, -- [1]
					["name"] = "typejewel",
				},
				["Meat"] = {
					{
						["type"] = "ItemType",
						["itype"] = "Trade Goods",
						["isubtype"] = "Meat",
					}, -- [1]
					["name"] = "Meat",
				},
				["Parts"] = {
					{
						["type"] = "ItemType",
						["itype"] = "Trade Goods",
						["isubtype"] = "Devices",
					}, -- [1]
					{
						["type"] = "ItemType",
						["itype"] = "Trade Goods",
						["isubtype"] = "Parts",
					}, -- [2]
					{
						["type"] = "ItemType",
						["itype"] = "Trade Goods",
						["isubtype"] = "Explosives",
					}, -- [3]
					["name"] = "Parts",
				},
				["typeplate"] = {
					{
						["type"] = "ItemType",
						["itype"] = "Armor",
						["isubtype"] = "Plate",
					}, -- [1]
					["name"] = "typeplate",
				},
				["Trash"] = {
					{
						["type"] = "Quality",
						["comp"] = "<=",
						["quality"] = 0,
					}, -- [1]
					{
						["operation"] = "NOT",
						["type"] = "ItemType",
						["itype"] = "Armor",
					}, -- [2]
					{
						["operation"] = "NOT",
						["type"] = "ItemType",
						["itype"] = "Weapon",
					}, -- [3]
					["name"] = "Trash",
				},
				["typecloth"] = {
					{
						["type"] = "ItemType",
						["itype"] = "Armor",
						["isubtype"] = "Cloth",
					}, -- [1]
					["name"] = "typecloth",
				},
				["FirstAid"] = {
					{
						["setname"] = "Tradeskill.Crafted.First Aid",
						["type"] = "PTSet",
					}, -- [1]
					["name"] = "FirstAid",
				},
				["Minerals"] = {
					{
						["type"] = "ItemType",
						["itype"] = "Trade Goods",
						["isubtype"] = "Metal & Stone",
					}, -- [1]
					["name"] = "Minerals",
				},
				["Tradeskill Mats"] = {
					{
						["setname"] = "Tradeskill.Mat.ByProfession",
						["type"] = "PTSet",
					}, -- [1]
					{
						["operation"] = "NOT",
						["type"] = "ItemType",
						["itype"] = "Trade Goods",
						["isubtype"] = "Elemental",
					}, -- [2]
					{
						["operation"] = "NOT",
						["type"] = "ItemType",
						["itype"] = "Trade Goods",
						["isubtype"] = "Cloth",
					}, -- [3]
					{
						["operation"] = "NOT",
						["type"] = "ItemType",
						["itype"] = "Trade Goods",
						["isubtype"] = "Leather",
					}, -- [4]
					{
						["operation"] = "NOT",
						["type"] = "ItemType",
						["itype"] = "Trade Goods",
						["isubtype"] = "Metal & Stone",
					}, -- [5]
					{
						["operation"] = "NOT",
						["type"] = "ItemType",
						["itype"] = "Trade Goods",
						["isubtype"] = "Herb",
					}, -- [6]
					{
						["operation"] = "NOT",
						["type"] = "ItemType",
						["itype"] = "Trade Goods",
						["isubtype"] = "Enchanting",
					}, -- [7]
					{
						["operation"] = "NOT",
						["type"] = "ItemType",
						["itype"] = "Trade Goods",
						["isubtype"] = "Jewelcrafting",
					}, -- [8]
					{
						["operation"] = "NOT",
						["type"] = "ItemType",
						["itype"] = "Trade Goods",
						["isubtype"] = "Parts",
					}, -- [9]
					{
						["operation"] = "NOT",
						["type"] = "ItemType",
						["itype"] = "Trade Goods",
						["isubtype"] = "Devices",
					}, -- [10]
					{
						["operation"] = "NOT",
						["type"] = "ItemType",
						["itype"] = "Trade Goods",
						["isubtype"] = "Explosives",
					}, -- [11]
					{
						["operation"] = "NOT",
						["type"] = "ItemType",
						["itype"] = "Consumable",
						["isubtype"] = "Potion",
					}, -- [12]
					{
						["operation"] = "NOT",
						["type"] = "ItemType",
						["itype"] = "Consumable",
					}, -- [13]
					{
						["operation"] = "NOT",
						["type"] = "PTSet",
						["setname"] = "Tradeskill.Tool",
					}, -- [14]
					{
						["operation"] = "NOT",
						["type"] = "ItemType",
						["itype"] = "Miscellaneous",
						["isubtype"] = "Reagent",
					}, -- [15]
					["name"] = "Tradeskill Mats",
				},
				["TrashEquip"] = {
					{
						["itype"] = "Armor",
						["type"] = "ItemType",
					}, -- [1]
					{
						["operation"] = "OR",
						["type"] = "ItemType",
						["itype"] = "Weapon",
					}, -- [2]
					{
						["operation"] = "AND",
						["type"] = "Quality",
						["comp"] = "<=",
						["quality"] = 1,
					}, -- [3]
					{
						["operation"] = "NOT",
						["type"] = "PTSet",
						["setname"] = "Tradeskill.Tool",
					}, -- [4]
					{
						["operation"] = "NOT",
						["type"] = "ItemType",
						["itype"] = "Quest",
					}, -- [5]
					["name"] = "TrashEquip",
				},
				["typemail"] = {
					{
						["type"] = "ItemType",
						["itype"] = "Armor",
						["isubtype"] = "Mail",
					}, -- [1]
					["name"] = "typemail",
				},
				["Relics"] = {
					{
						["type"] = "EquipLoc",
						["equiploc"] = "INVTYPE_RELIC",
					}, -- [1]
					{
						["type"] = "ItemType",
						["itype"] = "Armor",
						["isubtype"] = "Totems",
					}, -- [2]
					{
						["type"] = "ItemType",
						["itype"] = "Armor",
						["isubtype"] = "Sigils",
					}, -- [3]
					{
						["type"] = "ItemType",
						["itype"] = "Armor",
						["isubtype"] = "Idols",
					}, -- [4]
					["name"] = "Relics",
				},
				["Gathered"] = {
					["name"] = "Gathered",
				},
				["Alch"] = {
					{
						["type"] = "ItemType",
						["itype"] = "Trade Goods",
						["isubtype"] = "Herb",
					}, -- [1]
					["name"] = "Alch",
				},
				["Recipes"] = {
					{
						["itype"] = "Recipe",
						["type"] = "ItemType",
					}, -- [1]
					["name"] = "Recipes",
				},
				["Other"] = {
					{
						["type"] = "Other",
					}, -- [1]
					["name"] = "Other",
				},
				["Weapons"] = {
					{
						["itype"] = "Weapon",
						["type"] = "ItemType",
					}, -- [1]
					{
						["isubtype"] = "Shields",
						["itype"] = "Armor",
						["type"] = "ItemType",
					}, -- [2]
					{
						["operation"] = "NOT",
						["type"] = "PTSet",
						["setname"] = "Tradeskill.Tool",
					}, -- [3]
					{
						["operation"] = "NOT",
						["type"] = "ItemType",
						["itype"] = "Weapon",
						["isubtype"] = "One-Handed Axes",
					}, -- [4]
					{
						["operation"] = "NOT",
						["type"] = "ItemType",
						["itype"] = "Weapon",
						["isubtype"] = "Two-Handed Axes",
					}, -- [5]
					{
						["operation"] = "NOT",
						["type"] = "ItemType",
						["itype"] = "Weapon",
						["isubtype"] = "One-Handed Maces",
					}, -- [6]
					{
						["operation"] = "NOT",
						["type"] = "ItemType",
						["itype"] = "Weapon",
						["isubtype"] = "Two-Handed Maces",
					}, -- [7]
					{
						["operation"] = "NOT",
						["type"] = "ItemType",
						["itype"] = "Weapon",
						["isubtype"] = "Polearms",
					}, -- [8]
					{
						["operation"] = "NOT",
						["type"] = "ItemType",
						["itype"] = "Weapon",
						["isubtype"] = "One-Handed Swords",
					}, -- [9]
					{
						["operation"] = "NOT",
						["type"] = "ItemType",
						["itype"] = "Weapon",
						["isubtype"] = "Two-Handed Swords",
					}, -- [10]
					{
						["operation"] = "NOT",
						["type"] = "ItemType",
						["itype"] = "Weapon",
						["isubtype"] = "Staves",
					}, -- [11]
					{
						["operation"] = "NOT",
						["type"] = "ItemType",
						["itype"] = "Weapon",
						["isubtype"] = "Daggers",
					}, -- [12]
					{
						["type"] = "EquipLoc",
						["equiploc"] = "INVTYPE_WEAPONOFFHAND",
					}, -- [13]
					{
						["type"] = "EquipLoc",
						["equiploc"] = "INVTYPE_HOLDABLE",
					}, -- [14]
					["name"] = "Weapons",
				},
				["Ranged"] = {
					{
						["type"] = "ItemType",
						["itype"] = "Weapon",
						["isubtype"] = "Bows",
					}, -- [1]
					{
						["type"] = "ItemType",
						["itype"] = "Weapon",
						["isubtype"] = "Guns",
					}, -- [2]
					{
						["isubtype"] = "Crossbows",
						["itype"] = "Weapon",
						["type"] = "ItemType",
					}, -- [3]
					{
						["type"] = "ItemType",
						["itype"] = "Weapon",
						["isubtype"] = "Thrown",
					}, -- [4]
					{
						["type"] = "ItemType",
						["itype"] = "Weapon",
						["isubtype"] = "Wands",
					}, -- [5]
					["name"] = "Ranged",
				},
				["Reagents"] = {
					{
						["type"] = "ItemType",
						["itype"] = "Miscellaneous",
						["isubtype"] = "Reagent",
					}, -- [1]
					["name"] = "Reagents",
				},
			},
			["sortnewfirst"] = false,
			["skin"] = "oSkin",
			["minimapPosition"] = 29.96235498762751,
			["layout"] = "manual",
		},
	},
}
