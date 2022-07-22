local att = {}
att.name = "bo2_fmj"
att.displayName = "Full Metal Jacket"
att.displayNameShort = "FMJ"

att.statModifiers = {DamageMult = 0.2,
	RecoilMult = 0.8}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/bo2_fmj")
	att.description = {}
end

CustomizableWeaponry:registerAttachment(att)