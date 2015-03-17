
TellMeWhenDB = {
	["profileKeys"] = {
		["Modin - 世界之樹"] = "Modin - 世界之樹",
		["Korohamaru - 冰霜之刺"] = "Korohamaru - 冰霜之刺",
		["Modin - 聖光之願"] = "Modin - 聖光之願",
		["Tessadar - 冰霜之刺"] = "Tessadar - 冰霜之刺",
		["Sodin - 聖光之願"] = "Sodin - 聖光之願",
		["Karrigan - 冰霜之刺"] = "Karrigan - 冰霜之刺",
		["Lksodin - 冰霜之刺"] = "Lksodin - 冰霜之刺",
		["Karrigan - 聖光之願"] = "Karrigan - 聖光之願",
		["Soullessdoll - 聖光之願"] = "Soullessdoll - 聖光之願",
		["Lksodin - 世界之樹"] = "Lksodin - 世界之樹",
		["Konohamaru - 聖光之願"] = "Konohamaru - 聖光之願",
		["Kaidun - 聖光之願"] = "Kaidun - 聖光之願",
		["Menun - 聖光之願"] = "Menun - 聖光之願",
	},
	["global"] = {
		["TextLayouts"] = {
			["icon1"] = {
				{
				}, -- [1]
				{
				}, -- [2]
			},
			["bar2"] = {
				{
				}, -- [1]
				{
				}, -- [2]
			},
		},
		["HelpSettings"] = {
			["CNDT_ANDOR_FIRSTSEE"] = true,
			["SUG_FIRSTHELP"] = true,
			["SCROLLBAR_DROPDOWN"] = true,
			["ICON_EXPORT_DOCOPY"] = true,
			["SIMPLEGSTAB"] = true,
		},
		["AllowCombatConfig"] = true,
	},
	["Version"] = 72603,
	["profiles"] = {
		["Modin - 世界之樹"] = {
			["Locked"] = true,
			["Groups"] = {
				{
					["GUID"] = "TMW:group:1L0sDx5eUbYy",
					["Point"] = {
						["y"] = -80.5001220703125,
						["x"] = 6.9999098777771,
						["point"] = "LEFT",
						["relativePoint"] = "LEFT",
					},
				}, -- [1]
			},
			["Version"] = 72603,
		},
		["Korohamaru - 冰霜之刺"] = {
			["Locked"] = true,
			["Groups"] = {
				{
					["GUID"] = "TMW:group:1L0zTHNIce0l",
					["Point"] = {
						["y"] = -103.499923706055,
						["x"] = 51.5,
					},
				}, -- [1]
			},
			["Version"] = 72603,
		},
		["Modin - 聖光之願"] = {
			["Groups"] = {
				{
					["GUID"] = "TMW:group:1L1BTyLsY43U",
				}, -- [1]
			},
			["Version"] = 72603,
		},
		["Tessadar - 冰霜之刺"] = {
			["Locked"] = true,
			["Groups"] = {
				{
					["GUID"] = "TMW:group:1L0smeQ0JVwv",
					["Point"] = {
						["y"] = 37.5,
						["x"] = -2.49984741210938,
					},
				}, -- [1]
			},
			["Version"] = 72603,
		},
		["Sodin - 聖光之願"] = {
			["Locked"] = true,
			["Groups"] = {
				{
					["GUID"] = "TMW:group:1L1AqIUYRvMR",
					["Point"] = {
						["y"] = 99.9999237060547,
						["x"] = -173.999969482422,
						["point"] = "BOTTOM",
						["relativePoint"] = "BOTTOM",
					},
				}, -- [1]
			},
			["Version"] = 72603,
		},
		["Karrigan - 冰霜之刺"] = {
			["Locked"] = true,
			["Groups"] = {
				{
					["GUID"] = "TMW:group:1L14HSRGfHoR",
					["Point"] = {
						["y"] = 97.5000076293945,
						["x"] = -166.000183105469,
						["point"] = "BOTTOM",
						["relativePoint"] = "BOTTOM",
					},
				}, -- [1]
			},
			["Version"] = 72603,
		},
		["Lksodin - 冰霜之刺"] = {
			["NumGroups"] = 2,
			["Groups"] = {
				{
					["GUID"] = "TMW:group:1L0zpRACrfuS",
					["Point"] = {
						["y"] = -73.7987767746979,
						["x"] = -105.597870813641,
					},
					["Scale"] = 1.66668927669525,
					["Role"] = 5,
					["Tree2"] = false,
					["Name"] = "武器戰",
					["Tree3"] = false,
					["Icons"] = {
						{
							["BuffOrDebuff"] = "HARMFUL",
							["ConditionAlpha"] = 0.83,
							["Unit"] = "target",
							["OnlyMine"] = true,
							["Sort"] = -1,
							["Type"] = "buff",
							["UnitConditions"] = {
								{
									["Type"] = "ALIVE",
								}, -- [1]
								{
									["Type"] = "REACT",
									["Level"] = 1,
								}, -- [2]
								["n"] = 2,
							},
							["DurationAlpha"] = 0.16,
							["Name"] = "撕裂",
							["Conditions"] = {
								{
									["Type"] = "CLASS2",
									["BitFlags"] = 1,
								}, -- [1]
								{
									["Type"] = "TREE",
									["Level"] = 1,
								}, -- [2]
								["n"] = 2,
							},
							["ShowWhen"] = 1,
							["Enabled"] = true,
							["HideIfNoUnits"] = true,
							["DurationMax"] = 15,
						}, -- [1]
						{
							["ShowTimer"] = true,
							["BuffOrDebuff"] = "HARMFUL",
							["ConditionAlpha"] = 0.83,
							["Unit"] = "target",
							["OnlyMine"] = true,
							["Sort"] = -1,
							["Type"] = "buff",
							["UnitConditions"] = {
								{
									["Type"] = "ALIVE",
								}, -- [1]
								{
									["Type"] = "REACT",
									["Level"] = 1,
								}, -- [2]
								["n"] = 2,
							},
							["DurationAlpha"] = 0.16,
							["ShowTimerText"] = true,
							["DurationMaxEnabled"] = true,
							["HideIfNoUnits"] = true,
							["Enabled"] = true,
							["Conditions"] = {
								{
									["Type"] = "CLASS2",
									["BitFlags"] = 1,
								}, -- [1]
								{
									["Type"] = "TREE",
									["Level"] = 1,
								}, -- [2]
								["n"] = 2,
							},
							["DurationMax"] = 5.5,
							["Name"] = "撕裂",
						}, -- [2]
					},
				}, -- [1]
				{
					["GUID"] = "TMW:group:1L25jvci=YOc",
					["Point"] = {
						["y"] = -64.4112694740168,
						["x"] = -103.528176111596,
					},
					["Scale"] = 1.70000898838043,
					["Role"] = 5,
					["Tree2"] = false,
					["Tree1"] = false,
					["Name"] = "防戰",
					["Icons"] = {
						{
							["ShowTimer"] = true,
							["Type"] = "buff",
							["Alpha"] = 0.67,
							["DurationAlpha"] = 0.53,
							["Name"] = "盾牌格擋",
							["ShowTimerText"] = true,
							["Enabled"] = true,
							["Conditions"] = {
								{
									["Type"] = "TREE",
									["Level"] = 3,
								}, -- [1]
								{
									["Type"] = "CLASS2",
									["BitFlags"] = 1,
								}, -- [2]
								["n"] = 2,
							},
							["DurationMax"] = 12,
						}, -- [1]
						{
							["ShowTimer"] = true,
							["Type"] = "buff",
							["Alpha"] = 0.67,
							["DurationAlpha"] = 0.53,
							["ShowTimerText"] = true,
							["Name"] = "盾牌屏障",
							["Enabled"] = true,
							["Conditions"] = {
								{
									["Type"] = "TREE",
									["Level"] = 3,
								}, -- [1]
								{
									["Type"] = "CLASS2",
									["BitFlags"] = 1,
								}, -- [2]
								["n"] = 2,
							},
							["DurationMax"] = 12,
						}, -- [2]
					},
				}, -- [2]
			},
			["Locked"] = true,
			["Version"] = 72603,
			["DrawEdge"] = true,
		},
		["Karrigan - 聖光之願"] = {
			["Groups"] = {
				{
					["GUID"] = "TMW:group:1L1BWxfB4e3P",
					["Point"] = {
						["y"] = 93.000129699707,
						["x"] = -178.500122070313,
						["point"] = "BOTTOM",
						["relativePoint"] = "BOTTOM",
					},
				}, -- [1]
			},
			["Version"] = 72603,
		},
		["Soullessdoll - 聖光之願"] = {
			["Locked"] = true,
			["Groups"] = {
				{
					["GUID"] = "TMW:group:1L1AQRtBVlcj",
					["Point"] = {
						["y"] = 94.5000457763672,
						["x"] = -176.500122070313,
						["point"] = "BOTTOM",
						["relativePoint"] = "BOTTOM",
					},
				}, -- [1]
			},
			["Version"] = 72603,
		},
		["Lksodin - 世界之樹"] = {
			["Locked"] = true,
			["Groups"] = {
				{
					["GUID"] = "TMW:group:1L0plgCLlrZA",
				}, -- [1]
			},
			["Version"] = 72603,
		},
		["Konohamaru - 聖光之願"] = {
			["Locked"] = true,
			["Groups"] = {
				{
					["GUID"] = "TMW:group:1L1AxHHlhneJ",
					["Point"] = {
						["y"] = 89.0000076293945,
						["x"] = -178.500061035156,
						["point"] = "BOTTOM",
						["relativePoint"] = "BOTTOM",
					},
				}, -- [1]
			},
			["Version"] = 72603,
		},
		["Kaidun - 聖光之願"] = {
			["Version"] = 72603,
			["Groups"] = {
				{
					["GUID"] = "TMW:group:1L1BfiPT06fE",
				}, -- [1]
			},
		},
		["Menun - 聖光之願"] = {
			["Version"] = 72603,
			["Groups"] = {
				{
					["GUID"] = "TMW:group:1L1Bf3Bokr_0",
					["Point"] = {
						["y"] = 96.5000305175781,
						["x"] = -176.000030517578,
						["point"] = "BOTTOM",
						["relativePoint"] = "BOTTOM",
					},
				}, -- [1]
			},
		},
	},
}
