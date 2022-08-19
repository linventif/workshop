local att = {}
att.name = "bo2_artwar"
att.displayName = "Art Of War Camo"
att.displayNameShort = "ArtOfWar"
att.isBG = true

att.statModifiers = {}

if CLIENT then
	att.displayIcon = surface.GetTextureID("entities/bg_hk416_paint1")
	att.description = {[1] = {t = "Custom finish for your weapon.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	if SERVER then
		return
	end

	if self.CW_VM then
		self.CW_VM:SetSkin(7)
	end
end

function att:detachFunc()
	if SERVER then
		return
	end

	if self.CW_VM then
		self.CW_VM:SetSkin(0)
	end
end

CustomizableWeaponry:registerAttachment(att)