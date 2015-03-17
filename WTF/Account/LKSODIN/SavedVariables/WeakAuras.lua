
WeakAurasSaved = {
	["login_squelch_time"] = 10,
	["registered"] = {
	},
	["displays"] = {
		["盾擋"] = {
			["fontSize"] = 12,
			["displayStacks"] = "%s",
			["numTriggers"] = 1,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["untrigger"] = {
			},
			["stacksPoint"] = "BOTTOMRIGHT",
			["yOffset"] = -300.000213623047,
			["anchorPoint"] = "CENTER",
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["id"] = "盾擋",
			["customTextUpdate"] = "update",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["fontFlags"] = "OUTLINE",
			["stacksContainment"] = "INSIDE",
			["zoom"] = 0,
			["auto"] = true,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["rem"] = "12",
				["spellId"] = "2565",
				["subeventSuffix"] = "_CAST_START",
				["event"] = "Health",
				["names"] = {
					"盾牌格擋", -- [1]
				},
				["useRem"] = true,
				["use_spellId"] = true,
				["spellIds"] = {
					2565, -- [1]
				},
				["type"] = "aura",
				["remOperator"] = "<",
				["unit"] = "player",
				["subeventPrefix"] = "SPELL",
				["debuffType"] = "HELPFUL",
			},
			["width"] = 64,
			["frameStrata"] = 1,
			["desaturate"] = false,
			["xOffset"] = -436.000366210938,
			["font"] = "Friz Quadrata TT",
			["inverse"] = false,
			["stickyDuration"] = false,
			["height"] = 64,
			["icon"] = true,
			["load"] = {
				["use_never"] = false,
				["talent"] = {
					["single"] = 21,
					["multi"] = {
						[21] = true,
					},
				},
				["class"] = {
					["single"] = "WARRIOR",
					["multi"] = {
					},
				},
				["use_class"] = true,
				["role"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["use_spec"] = true,
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["spec"] = {
					["single"] = 3,
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["textColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
		},
		["撕裂"] = {
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["yOffset"] = -305.000045776367,
			["anchorPoint"] = "CENTER",
			["customTextUpdate"] = "update",
			["icon"] = true,
			["fontFlags"] = "OUTLINE",
			["useTooltip"] = false,
			["selfPoint"] = "BOTTOMLEFT",
			["trigger"] = {
				["use_castType"] = false,
				["rem"] = "5.5",
				["debuffClass"] = "none",
				["ownOnly"] = true,
				["use_spell"] = true,
				["subeventPrefix"] = "SPELL",
				["stack_info"] = "count",
				["autoclone"] = false,
				["name_info"] = "aura",
				["use_hand"] = true,
				["name"] = "撕裂",
				["spellIds"] = {
				},
				["hand"] = "main",
				["debuffType"] = "HARMFUL",
				["unevent"] = "auto",
				["type"] = "aura",
				["use_name"] = true,
				["subeventSuffix"] = "_CAST_START",
				["name_operator"] = "==",
				["event"] = "Action Usable",
				["countOperator"] = "<=",
				["spellName"] = 0,
				["castType"] = "channel",
				["use_spellName"] = true,
				["count"] = "1",
				["names"] = {
					"撕裂", -- [1]
				},
				["remOperator"] = "<",
				["unit"] = "target",
				["use_unit"] = true,
				["useRem"] = true,
			},
			["stickyDuration"] = true,
			["font"] = "Friz Quadrata TT",
			["height"] = 50,
			["load"] = {
				["use_never"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "WARRIOR",
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["use_class"] = true,
				["use_spec"] = true,
				["race"] = {
					["multi"] = {
					},
				},
				["use_combat"] = true,
				["spec"] = {
					["single"] = 1,
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["fontSize"] = 12,
			["displayStacks"] = "%s",
			["regionType"] = "icon",
			["disjunctive"] = true,
			["cooldown"] = false,
			["stacksContainment"] = "INSIDE",
			["zoom"] = 0,
			["auto"] = true,
			["additional_triggers"] = {
				{
					["trigger"] = {
						["type"] = "aura",
						["unevent"] = "auto",
						["event"] = "Chat Message",
						["subeventPrefix"] = "SPELL",
						["spellIds"] = {
						},
						["inverse"] = true,
						["names"] = {
							"撕裂", -- [1]
						},
						["unit"] = "target",
						["subeventSuffix"] = "_CAST_START",
						["debuffType"] = "HARMFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["id"] = "撕裂",
			["xOffset"] = -428.000427246094,
			["frameStrata"] = 1,
			["width"] = 50,
			["untrigger"] = {
				["unit"] = "target",
			},
			["numTriggers"] = 2,
			["inverse"] = false,
			["actions"] = {
				["start"] = {
					["do_message"] = false,
					["do_sound"] = false,
				},
				["finish"] = {
					["do_glow"] = true,
					["glow_action"] = "show",
					["do_sound"] = false,
				},
				["init"] = {
					["do_custom"] = false,
				},
			},
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["desaturate"] = false,
			["stacksPoint"] = "BOTTOMRIGHT",
			["textColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
		},
		["New"] = {
			["fontSize"] = 12,
			["displayStacks"] = "%s",
			["numTriggers"] = 1,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["untrigger"] = {
			},
			["stacksPoint"] = "BOTTOMRIGHT",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["id"] = "New",
			["customTextUpdate"] = "update",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["fontFlags"] = "OUTLINE",
			["stacksContainment"] = "INSIDE",
			["zoom"] = 0,
			["auto"] = true,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["trigger"] = {
				["subeventPrefix"] = "SPELL",
				["type"] = "aura",
				["spellIds"] = {
				},
				["subeventSuffix"] = "_CAST_START",
				["debuffType"] = "HELPFUL",
				["names"] = {
				},
				["event"] = "Health",
				["unit"] = "player",
			},
			["width"] = 64,
			["frameStrata"] = 1,
			["desaturate"] = false,
			["xOffset"] = 0,
			["font"] = "Friz Quadrata TT",
			["inverse"] = false,
			["stickyDuration"] = false,
			["height"] = 64,
			["icon"] = true,
			["load"] = {
				["difficulty"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["textColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
		},
	},
	["frame"] = {
		["xOffset"] = -137.999877929688,
		["width"] = 629.999938964844,
		["height"] = 492,
		["yOffset"] = -131.999938964844,
	},
	["tempIconCache"] = {
		["盾牌格擋"] = "Interface\\Icons\\Ability_Defend",
		["撕裂"] = "Interface\\Icons\\Ability_Gouge",
	},
	["talent_cache"] = {
		["HUNTER"] = {
			{
				["name"] = "疾影術",
				["icon"] = "INTERFACE\\ICONS\\ability_hunter_posthaste",
			}, -- [1]
			{
				["name"] = "險裡逃生",
				["icon"] = "Interface\\Icons\\INV_Misc_Web_01",
			}, -- [2]
			{
				["name"] = "臥虎藏龍",
				["icon"] = "INTERFACE\\ICONS\\ability_hunter_pet_chimera",
			}, -- [3]
			{
				["name"] = "禁錮射擊",
				["icon"] = "INTERFACE\\ICONS\\spell_shaman_bindelemental",
			}, -- [4]
			{
				["name"] = "翼龍釘刺",
				["icon"] = "Interface\\Icons\\INV_Spear_02",
			}, -- [5]
			{
				["name"] = "脅迫",
				["icon"] = "Interface\\Icons\\Ability_Devour",
			}, -- [6]
			{
				["name"] = "心曠神怡",
				["icon"] = "INTERFACE\\ICONS\\ability_hunter_onewithnature",
			}, -- [7]
			{
				["name"] = "鋼鷹",
				["icon"] = "Interface\\Icons\\spell_hunter_aspectoftheironhawk",
			}, -- [8]
			{
				["name"] = "靈魂聯結",
				["icon"] = "Interface\\Icons\\Ability_Druid_DemoralizingRoar",
			}, -- [9]
			{
				["name"] = "穩固集中",
				["icon"] = "Interface\\Icons\\Ability_Hunter_ImprovedSteadyShot",
			}, -- [10]
			{
				["name"] = "凶暴野獸",
				["icon"] = "INTERFACE\\ICONS\\ability_hunter_sickem",
			}, -- [11]
			{
				["name"] = "獵殺快感",
				["icon"] = "Interface\\Icons\\Ability_Hunter_ThrilloftheHunt",
			}, -- [12]
			{
				["name"] = "黑鴉獵殺",
				["icon"] = "Interface\\Icons\\ability_hunter_murderofcrows",
			}, -- [13]
			{
				["name"] = "閃現追擊",
				["icon"] = "Interface\\Icons\\Spell_Arcane_Arcane04",
			}, -- [14]
			{
				["name"] = "奔竄",
				["icon"] = "INTERFACE\\ICONS\\ability_hunter_bestialdiscipline",
			}, -- [15]
			{
				["name"] = "刀刃飛擲",
				["icon"] = "Interface\\Icons\\ability_glaivetoss",
			}, -- [16]
			{
				["name"] = "強力射擊",
				["icon"] = "INTERFACE\\ICONS\\ability_hunter_resistanceisfutile",
			}, -- [17]
			{
				["name"] = "彈幕",
				["icon"] = "Interface\\Icons\\Ability_Hunter_RapidRegeneration",
			}, -- [18]
			{
				["name"] = "奇特彈藥",
				["icon"] = "Interface\\Icons\\inv_ammo_bullet_07",
			}, -- [19]
			{
				["name"] = "集中射擊",
				["icon"] = "Interface\\Icons\\spell_hunter_focusingshot",
			}, -- [20]
			{
				["name"] = "隨遇而安",
				["icon"] = "Interface\\Icons\\spell_hunter_adaptation",
			}, -- [21]
		},
		["WARRIOR"] = {
			{
				["name"] = "勢不可當",
				["icon"] = "Interface\\Icons\\Ability_Warrior_BullRush",
			}, -- [1]
			{
				["name"] = "雙倍速",
				["icon"] = "Interface\\Icons\\INV_Misc_Horn_04",
			}, -- [2]
			{
				["name"] = "戰爭使者",
				["icon"] = "Interface\\Icons\\Ability_Warrior_Warbringer",
			}, -- [3]
			{
				["name"] = "狂怒恢復",
				["icon"] = "Interface\\Icons\\Ability_Warrior_FocusedRage",
			}, -- [4]
			{
				["name"] = "復甦之風",
				["icon"] = "Interface\\Icons\\Ability_Hunter_Harass",
			}, -- [5]
			{
				["name"] = "勝利在望",
				["icon"] = "Interface\\Icons\\spell_impending_victory",
			}, -- [6]
			{
				["name"] = "沉重反衝",
				["icon"] = "Interface\\Icons\\INV_Shield_32",
			}, -- [7]
			{
				["name"] = "驟亡",
				["icon"] = "Interface\\Icons\\Ability_Warrior_ImprovedDisciplines",
			}, -- [8]
			{
				["name"] = "不屈打擊",
				["icon"] = "Interface\\Icons\\Ability_Warrior_BloodBath",
			}, -- [9]
			{
				["name"] = "暴風怒擲",
				["icon"] = "Interface\\Icons\\warrior_talent_icon_stormbolt",
			}, -- [10]
			{
				["name"] = "震懾波",
				["icon"] = "Interface\\Icons\\Ability_Warrior_Shockwave",
			}, -- [11]
			{
				["name"] = "龍吼",
				["icon"] = "Interface\\Icons\\ability_warrior_dragonroar",
			}, -- [12]
			{
				["name"] = "群體法術反射",
				["icon"] = "Interface\\Icons\\Ability_Warrior_ShieldBreak",
			}, -- [13]
			{
				["name"] = "安全守護",
				["icon"] = "Interface\\Icons\\Ability_Warrior_Safeguard",
			}, -- [14]
			{
				["name"] = "戒備守護",
				["icon"] = "Interface\\Icons\\Ability_Warrior_Vigilance",
			}, -- [15]
			{
				["name"] = "巨像化身",
				["icon"] = "Interface\\Icons\\warrior_talent_icon_avatar",
			}, -- [16]
			{
				["name"] = "浴血",
				["icon"] = "Interface\\Icons\\Ability_Warrior_BloodBath",
			}, -- [17]
			{
				["name"] = "劍刃風暴",
				["icon"] = "Interface\\Icons\\Ability_Warrior_Bladestorm",
			}, -- [18]
			{
				["name"] = "憤怒掌控",
				["icon"] = "Interface\\Icons\\warrior_talent_icon_angermanagement",
			}, -- [19]
			{
				["name"] = "劫毀旋刃",
				["icon"] = "Interface\\Icons\\warrior_talent_icon_ravager",
			}, -- [20]
			{
				["name"] = "鬥士的決心",
				["icon"] = "Interface\\Icons\\spell_warrior_gladiatorstance",
			}, -- [21]
		},
		["ROGUE"] = {
		},
		["MAGE"] = {
		},
		["PRIEST"] = {
			{
				["name"] = "絕望禱言",
				["icon"] = "Interface\\Icons\\Spell_Holy_TestOfFaith",
			}, -- [1]
			{
				["name"] = "鬼魅幻影",
				["icon"] = "Interface\\Icons\\spell_priest_spectralguise",
			}, -- [2]
			{
				["name"] = "天使之壁",
				["icon"] = "Interface\\Icons\\ability_priest_angelicbulwark",
			}, -- [3]
			{
				["name"] = "身心合一",
				["icon"] = "Interface\\Icons\\Spell_Holy_SymbolOfHope",
			}, -- [4]
			{
				["name"] = "天使之羽",
				["icon"] = "Interface\\Icons\\ability_priest_angelicfeather",
			}, -- [5]
			{
				["name"] = "幻影術",
				["icon"] = "Interface\\Icons\\ability_priest_phantasm",
			}, -- [6]
			{
				["name"] = "光之澎湃",
				["icon"] = "Interface\\Icons\\Spell_Holy_SurgeOfLight",
			}, -- [7]
			{
				["name"] = "屈心魔",
				["icon"] = "Interface\\Icons\\Spell_Shadow_SoulLeech_3",
			}, -- [8]
			{
				["name"] = "真言術:慰",
				["icon"] = "Interface\\Icons\\ability_priest_flashoflight",
			}, -- [9]
			{
				["name"] = "虛無觸鬚",
				["icon"] = "Interface\\Icons\\spell_priest_voidtendrils",
			}, -- [10]
			{
				["name"] = "心靈尖嘯",
				["icon"] = "Interface\\Icons\\Spell_Shadow_PsychicScream",
			}, -- [11]
			{
				["name"] = "支配心智",
				["icon"] = "Interface\\Icons\\Spell_Shadow_ShadowWordDominate",
			}, -- [12]
			{
				["name"] = "命運無常",
				["icon"] = "Interface\\Icons\\Spell_Shadow_MindTwisting",
			}, -- [13]
			{
				["name"] = "注入能量",
				["icon"] = "Interface\\Icons\\Spell_Holy_PowerInfusion",
			}, -- [14]
			{
				["name"] = "神聖洞察",
				["icon"] = "Interface\\Icons\\spell_priest_burningwill",
			}, -- [15]
			{
				["name"] = "神聖箭矢",
				["icon"] = "Interface\\Icons\\ability_priest_cascade",
			}, -- [16]
			{
				["name"] = "神性之星",
				["icon"] = "Interface\\Icons\\spell_priest_divinestar",
			}, -- [17]
			{
				["name"] = "輝環",
				["icon"] = "Interface\\Icons\\ability_priest_halo",
			}, -- [18]
			{
				["name"] = "意志清明",
				["icon"] = "Interface\\Icons\\ability_priest_clarityofwill",
			}, -- [19]
			{
				["name"] = "癒合真言",
				["icon"] = "Interface\\Icons\\ability_priest_wordsofmeaning",
			}, -- [20]
			{
				["name"] = "救贖恩典",
				["icon"] = "Interface\\Icons\\ability_priest_savinggrace",
			}, -- [21]
		},
		["WARLOCK"] = {
			{
				["name"] = "黑暗再生",
				["icon"] = "Interface\\Icons\\spell_warlock_darkregeneration",
			}, -- [1]
			{
				["name"] = "靈魂汲取",
				["icon"] = "Interface\\Icons\\warlock_siphonlife",
			}, -- [2]
			{
				["name"] = "收割生命",
				["icon"] = "Interface\\Icons\\spell_warlock_harvestoflife",
			}, -- [3]
			{
				["name"] = "恐懼嚎叫",
				["icon"] = "Interface\\Icons\\ability_warlock_howlofterror",
			}, -- [4]
			{
				["name"] = "死影纏繞",
				["icon"] = "Interface\\Icons\\ability_warlock_mortalcoil",
			}, -- [5]
			{
				["name"] = "暗影之怒",
				["icon"] = "Interface\\Icons\\ability_warlock_shadowfurytga",
			}, -- [6]
			{
				["name"] = "靈魂鏈結",
				["icon"] = "Interface\\Icons\\ability_warlock_soullink",
			}, -- [7]
			{
				["name"] = "犧牲契印",
				["icon"] = "Interface\\Icons\\warlock_sacrificial_pact",
			}, -- [8]
			{
				["name"] = "黑暗交易",
				["icon"] = "Interface\\Icons\\ability_deathwing_bloodcorruption_death",
			}, -- [9]
			{
				["name"] = "血性恐懼",
				["icon"] = "Interface\\Icons\\ability_deathwing_bloodcorruption_earth",
			}, -- [10]
			{
				["name"] = "燃燒狂奔",
				["icon"] = "Interface\\Icons\\ability_deathwing_sealarmorbreachtga",
			}, -- [11]
			{
				["name"] = "無縛意志",
				["icon"] = "Interface\\Icons\\warlock_spelldrain",
			}, -- [12]
			{
				["name"] = "至尊魔典",
				["icon"] = "Interface\\Icons\\warlock_grimoireofcommand",
			}, -- [13]
			{
				["name"] = "服侍魔典",
				["icon"] = "Interface\\Icons\\warlock_grimoireofservice",
			}, -- [14]
			{
				["name"] = "協調魔典",
				["icon"] = "Interface\\Icons\\warlock_grimoireofsacrifice",
			}, -- [15]
			{
				["name"] = "阿克蒙德之闇",
				["icon"] = "Interface\\Icons\\Achievement_Boss_Archimonde ",
			}, -- [16]
			{
				["name"] = "基爾加丹之詐",
				["icon"] = "Interface\\Icons\\Achievement_Boss_Kiljaedan",
			}, -- [17]
			{
				["name"] = "瑪諾洛斯之怒",
				["icon"] = "Interface\\Icons\\Achievement_Boss_Magtheridon",
			}, -- [18]
			{
				["name"] = "惡魔箭",
				["icon"] = "Interface\\Icons\\spell_warlock_demonbolt",
			}, -- [19]
			{
				["name"] = "災變",
				["icon"] = "INTERFACE\\ICONS\\achievement_zone_cataclysm",
			}, -- [20]
			{
				["name"] = "惡魔奴役",
				["icon"] = "Interface\\Icons\\spell_warlock_demonicservitude",
			}, -- [21]
		},
		["SHAMAN"] = {
			{
				["name"] = "自然守護者",
				["icon"] = "Interface\\Icons\\Spell_Nature_NatureGuardian",
			}, -- [1]
			{
				["name"] = "石之壁壘圖騰",
				["icon"] = "Interface\\Icons\\ability_shaman_stonebulwark",
			}, -- [2]
			{
				["name"] = "星界轉移",
				["icon"] = "Interface\\Icons\\ability_shaman_astralshift",
			}, -- [3]
			{
				["name"] = "冰凍之力",
				["icon"] = "Interface\\Icons\\Spell_Fire_BlueCano",
			}, -- [4]
			{
				["name"] = "陷地圖騰",
				["icon"] = "Interface\\Icons\\Spell_Nature_StrangleVines",
			}, -- [5]
			{
				["name"] = "風行圖騰",
				["icon"] = "Interface\\Icons\\ability_shaman_windwalktotem",
			}, -- [6]
			{
				["name"] = "元素呼喚",
				["icon"] = "Interface\\Icons\\ability_shaman_multitotemactivation",
			}, -- [7]
			{
				["name"] = "圖騰堅毅",
				["icon"] = "Interface\\Icons\\ability_shaman_totemcooldownrefund",
			}, -- [8]
			{
				["name"] = "圖騰投射",
				["icon"] = "Interface\\Icons\\ability_shaman_totemrelocation",
			}, -- [9]
			{
				["name"] = "精通元素",
				["icon"] = "Interface\\Icons\\Spell_Nature_WispHeal",
			}, -- [10]
			{
				["name"] = "先祖迅捷",
				["icon"] = "Interface\\Icons\\Spell_Shaman_ElementalOath",
			}, -- [11]
			{
				["name"] = "元素回應",
				["icon"] = "Interface\\Icons\\ability_shaman_echooftheelements",
			}, -- [12]
			{
				["name"] = "奔騰激流",
				["icon"] = "Interface\\Icons\\INV_Spear_04",
			}, -- [13]
			{
				["name"] = "先祖導引",
				["icon"] = "Interface\\Icons\\ability_shaman_ancestralguidance",
			}, -- [14]
			{
				["name"] = "治療傳導",
				["icon"] = "Interface\\Icons\\ability_shaman_fortifyingwaters",
			}, -- [15]
			{
				["name"] = "狂怒釋放",
				["icon"] = "Interface\\Icons\\shaman_talent_unleashedfury",
			}, -- [16]
			{
				["name"] = "原始元素師",
				["icon"] = "Interface\\Icons\\shaman_talent_primalelementalist",
			}, -- [17]
			{
				["name"] = "元素衝擊",
				["icon"] = "Interface\\Icons\\shaman_talent_elementalblast",
			}, -- [18]
			{
				["name"] = "元素融合",
				["icon"] = "Interface\\Icons\\spell_shaman_shockinglava",
			}, -- [19]
			{
				["name"] = "風暴元素圖騰",
				["icon"] = "Interface\\Icons\\spell_shaman_stormtotem",
			}, -- [20]
			{
				["name"] = "液態岩漿",
				["icon"] = "Interface\\Icons\\spell_shaman_spewlava",
			}, -- [21]
		},
		["DEATHKNIGHT"] = {
		},
		["DRUID"] = {
		},
		["MONK"] = {
		},
		["PALADIN"] = {
		},
	},
}
