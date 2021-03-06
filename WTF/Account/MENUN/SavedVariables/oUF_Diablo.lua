
OUF_DIABLO_DB_GLOB = {
	["rage"] = {
		["spark"] = {
			["alpha"] = 1,
		},
		["model"] = {
			["rotation"] = 0,
			["portraitZoom"] = 0,
			["displayInfo"] = 32368,
			["alpha"] = 0.222000017762184,
			["enable"] = false,
			["pos_y"] = 0.0810003280639649,
			["camDistanceScale"] = 0.907000005245209,
			["pos_x"] = 0.00800037384033203,
		},
		["value"] = {
			["top"] = {
				["color"] = {
					["b"] = 1,
					["g"] = 1,
					["r"] = 1,
				},
				["tag"] = "cur",
			},
			["bottom"] = {
				["color"] = {
					["b"] = 0.8,
					["g"] = 0.8,
					["r"] = 0.8,
				},
				["tag"] = "null",
			},
			["hideOnFull"] = false,
			["hideOnEmpty"] = true,
			["alpha"] = 1,
		},
		["galaxies"] = {
			["alpha"] = 0,
		},
		["filling"] = {
			["colorAuto"] = true,
			["color"] = {
				["b"] = 1,
				["g"] = 0,
				["r"] = 0,
			},
			["texture"] = "Interface\\AddOns\\oUF_Diablo\\media\\orb_filling16",
		},
		["highlight"] = {
			["alpha"] = 0,
		},
	},
	["mana"] = {
		["spark"] = {
			["alpha"] = 1,
		},
		["model"] = {
			["rotation"] = 0,
			["portraitZoom"] = 0,
			["displayInfo"] = 32368,
			["alpha"] = 0.222000017762184,
			["enable"] = true,
			["pos_y"] = 0.0810003280639649,
			["camDistanceScale"] = 0.907000005245209,
			["pos_x"] = 0.00800037384033203,
		},
		["value"] = {
			["top"] = {
				["color"] = {
					["b"] = 1,
					["g"] = 1,
					["r"] = 1,
				},
				["tag"] = "cur",
			},
			["bottom"] = {
				["color"] = {
					["b"] = 0.8,
					["g"] = 0.8,
					["r"] = 0.8,
				},
				["tag"] = "perp",
			},
			["hideOnFull"] = false,
			["hideOnEmpty"] = true,
			["alpha"] = 1,
		},
		["galaxies"] = {
			["alpha"] = 0,
		},
		["filling"] = {
			["colorAuto"] = false,
			["color"] = {
				["b"] = 1,
				["g"] = 0,
				["r"] = 0,
			},
			["texture"] = "Interface\\AddOns\\oUF_Diablo\\media\\orb_filling16",
		},
		["highlight"] = {
			["alpha"] = 0,
		},
	},
	["blood"] = {
		["spark"] = {
			["alpha"] = 0.900000035762787,
		},
		["model"] = {
			["rotation"] = -2.29699993133545,
			["portraitZoom"] = 0.409000009298325,
			["displayInfo"] = 32368,
			["alpha"] = 0.256000012159348,
			["enable"] = true,
			["pos_y"] = 0.188000202178955,
			["camDistanceScale"] = 1.01600015163422,
			["pos_x"] = 0.0430002212524414,
		},
		["value"] = {
			["top"] = {
				["color"] = {
					["b"] = 1,
					["g"] = 0.92156862745098,
					["r"] = 0.952941176470588,
				},
				["tag"] = "cur",
			},
			["bottom"] = {
				["color"] = {
					["b"] = 0.8,
					["g"] = 0.8,
					["r"] = 0.8,
				},
				["tag"] = "perp",
			},
			["hideOnFull"] = false,
			["hideOnEmpty"] = true,
			["alpha"] = 1,
		},
		["galaxies"] = {
			["alpha"] = 0.106000006198883,
		},
		["filling"] = {
			["colorAuto"] = false,
			["color"] = {
				["b"] = 0,
				["g"] = 0,
				["r"] = 1,
			},
			["texture"] = "Interface\\AddOns\\oUF_Diablo\\media\\orb_filling15",
		},
		["highlight"] = {
			["alpha"] = 0,
		},
	},
	["TEMPLATE_LIST"] = {
		{
			["value"] = "blood",
			["keepShownOnClick"] = false,
			["key"] = "blood",
			["notCheckable"] = true,
		}, -- [1]
		{
			["value"] = "mana",
			["keepShownOnClick"] = false,
			["key"] = "mana",
			["notCheckable"] = true,
		}, -- [2]
		{
			["value"] = "rage",
			["keepShownOnClick"] = false,
			["key"] = "rage",
			["notCheckable"] = true,
		}, -- [3]
	},
}
