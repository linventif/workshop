local ConVar = FindMetaTable("ConVar")
local GetInt = ConVar.GetInt

local cvar = CreateClientConVar("better_colors", "2", true, false, "Переключение режима 1-3")

local Filters = {
	{ -- default
	    ["$pp_colour_addr"]         = 0,
		["$pp_colour_addg"]         = 0,
		["$pp_colour_addb"]         = 0,
		["$pp_colour_brightness"]   = 0,
		["$pp_colour_contrast"]     = 1,
		["$pp_colour_colour"]       = 1,
		["$pp_colour_mulr"]         = 0,
		["$pp_colour_mulg"]         = 0,
		["$pp_colour_mulb"]         = 0
	},
	{ -- better
	    ["$pp_colour_addr"]         = 0,
		["$pp_colour_addg"]         = 0,
		["$pp_colour_addb"]         = 0,
		["$pp_colour_brightness"]   = 0,
		["$pp_colour_contrast"]     = 1,
		["$pp_colour_colour"]       = 1.5,
		["$pp_colour_mulr"]         = 0,
		["$pp_colour_mulg"]         = 0,
		["$pp_colour_mulb"]         = 0
	},
	{ -- crazy
		["$pp_colour_addr"]         = 0,
		["$pp_colour_addg"]         = 0,
		["$pp_colour_addb"]         = 0,
		["$pp_colour_brightness"]   = 0,
		["$pp_colour_contrast"]     = 1,
		["$pp_colour_colour"]       = 2.5,
		["$pp_colour_mulr"]         = 0,
		["$pp_colour_mulg"]         = 0,
		["$pp_colour_mulb"]         = 0
	}
}

hook.Add("RenderScreenspaceEffects", "BetterColors", function()
	DrawColorModify(Filters[GetInt(cvar)] or Filters[2])
end)