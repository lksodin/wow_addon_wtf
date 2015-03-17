
OmniCC4Config = {
	["version"] = "6.0.10",
	["groupSettings"] = {
		["base"] = {
			["styles"] = {
				["seconds"] = {
				},
				["minutes"] = {
				},
				["soon"] = {
				},
				["hours"] = {
				},
				["charging"] = {
				},
				["controlled"] = {
				},
			},
		},
		["Ignore"] = {
			["enabled"] = false,
			["styles"] = {
				["seconds"] = {
				},
				["minutes"] = {
				},
				["soon"] = {
				},
				["hours"] = {
				},
				["charging"] = {
				},
				["controlled"] = {
				},
			},
		},
	},
	["groups"] = {
		{
			["id"] = "Ignore",
			["rules"] = {
				"LossOfControl", -- [1]
				"TotemFrame", -- [2]
			},
			["enabled"] = true,
		}, -- [1]
	},
}
